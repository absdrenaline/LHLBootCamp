// Copyright (c) 2017 Lighthouse Labs. All rights reserved.
// 
// Notwithstanding the foregoing, you may not use, copy, modify, merge, publish,
// distribute, sublicense, create a derivative work, and/or sell copies of the
// Software in any work that is designed, intended, or marketed for pedagogical or
// instructional purposes related to programming, coding, application development,
// or information technology.  Permission for such use, copying, modification,
// merger, publication, distribution, sublicensing, creation of derivative works,
// or sale is expressly withheld.
// 
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

#import "MapViewController.h"
@import MapKit;
@import CoreLocation;
#import "Cafe.h"
#import "UberBean-Swift.h"


@interface MapViewController ()<CLLocationManagerDelegate, MKMapViewDelegate,SearchViewDelegate>

@property (nonatomic) MKMapView *mapView;
@property (nonatomic) CLLocationManager *locationManager;
@property (nonatomic) CLLocation *currentLocation;
@property (nonatomic) NSArray <MKAnnotation>*cafes;
@property (nonatomic, copy) NSString *searchTerm;

@end

@implementation MapViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  
  [self createMapView];
  self.locationManager = [[CLLocationManager alloc] init];
  self.locationManager.delegate = self;
  self.mapView.delegate = self;
  self.searchTerm = @"";
  [self.mapView registerClass:[MKMarkerAnnotationView class] forAnnotationViewWithReuseIdentifier:@"Cafe"];
  // request authorization only runs if not determined, but
  [self.locationManager requestWhenInUseAuthorization];
}


#pragma mark - Create Map

- (void)createMapView {
  self.mapView = [[MKMapView alloc] init];
  self.mapView.showsUserLocation = YES;
  [self.view addSubview:self.mapView];
  
  self.mapView.translatesAutoresizingMaskIntoConstraints = NO;
  [self.mapView.leftAnchor constraintEqualToAnchor:self.view.leftAnchor].active = YES;
  [self.mapView.topAnchor constraintEqualToAnchor:self.view.topAnchor].active = YES;
  [self.mapView.rightAnchor constraintEqualToAnchor:self.view.rightAnchor].active = YES;
  [self.mapView.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor].active = YES;
}

#pragma mark - Networking

-(void)fetchCafesWithUserLocation:(CLLocationCoordinate2D)location searchTerm:(NSString *)searchTerm completion:(void(^)(NSArray<MKAnnotation>*))handler {
  
  NetworkManager *networkManager = [[NetworkManager alloc] init];
  [networkManager fetchCafesWithUserLocation:location searchTerm:searchTerm completion:^(NSArray<id<MKAnnotation>> *cafes) {
    
    [[NSOperationQueue mainQueue] addOperationWithBlock:^{
      handler([cafes copy]);
    }];
    
  }];
  
  //[task resume];
}

#pragma mark - CLLocationManagerDelegate

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations {
  if (!self.currentLocation) {
    self.currentLocation = locations.firstObject;
    self.mapView.showsUserLocation = YES;
    [self setupRegion];
    
    [self fetchCafesWithUserLocation:self.currentLocation.coordinate searchTerm:nil completion:^(NSArray<MKAnnotation> *cafes) {
      self.cafes = cafes;
    }];
  }
}

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation {
  if ([annotation isKindOfClass:[MKUserLocation class]]) {
    return nil;
  }
  MKMarkerAnnotationView *annotationView = (MKMarkerAnnotationView*)[mapView dequeueReusableAnnotationViewWithIdentifier:@"Cafe" forAnnotation:annotation];
  if (annotationView == nil) {
    annotationView = [[MKMarkerAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"Cafe"];
  } else {
    annotationView.annotation = annotation;
  }
  
  annotationView.canShowCallout = YES;
  annotationView.animatesWhenAdded = YES;
  annotationView.rightCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeInfoLight];
  return annotationView;
}

- (void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control {
  
}

static const double lat = 0.01;
static const double lng = 0.01;

- (void)setupRegion {
  MKCoordinateSpan span = MKCoordinateSpanMake(lat, lng);
  MKCoordinateRegion region = MKCoordinateRegionMake(self.currentLocation.coordinate, span);
  [self.mapView setRegion:region animated:YES];
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error {
  NSLog(@"%@, %@", error.localizedDescription, error.localizedFailureReason);
}

- (void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status {
  // called each time with the status
  NSLog(@"%@: %@", @(__LINE__), @(status)); // 0 is not determined
  if (status == kCLAuthorizationStatusAuthorizedWhenInUse) {
    [manager requestLocation];
  }
}

#pragma mark - Cafes Setter

- (void)setCafes:(NSArray<MKAnnotation> *)cafes {
  
  _cafes = cafes;
  [self.mapView addAnnotations:cafes];
  [self.mapView showAnnotations:cafes animated:YES];
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
  
}

#pragma mark - Shake

- (BOOL)becomeFirstResponder {
  return YES;
}

- (void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event {
  if (motion == UIEventSubtypeMotionShake) {
    NSLog(@"Present the search view controller");
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    SearchViewController *searchViewController = (SearchViewController *)[storyboard instantiateViewControllerWithIdentifier:@"SearchVC"];
    searchViewController.delegate = self;
    searchViewController.searchTerm = self.searchTerm;
    [self presentViewController:searchViewController animated:YES completion:nil];
  }
}

- (void)searchViewController:(SearchViewController * _Nonnull)searchViewController search:(NSString * _Nonnull)search {
  NSLog(@"Searching for %@ cafes",search);
  self.searchTerm = search;
  [self fetchCafesWithUserLocation:self.currentLocation.coordinate searchTerm:search completion:^(NSArray<MKAnnotation> *cafes) {
    self.cafes = cafes;
  }];
  return ;
}

@end

