////  ViewController.m
// Created: 2019-06-14
//

#import "ViewController.h"
#import "Cafe.h"
#import "YelpAPI.h"

@interface ViewController () <CLLocationManagerDelegate, APIDelegate>
@property (weak, nonatomic) IBOutlet MKMapView *mapView;

@end

@implementation ViewController {
    CLLocationManager* locationManager;
    YelpAPI* yelpAPI;
    NSMutableArray<Cafe *> *cafes;
}

static NSString *const kYelpKey = @"";

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    cafes = [NSMutableArray new];
    locationManager = [[CLLocationManager alloc] init];
    locationManager.delegate = self;
    [locationManager requestWhenInUseAuthorization];
    yelpAPI = [[YelpAPI alloc] initWithAuthorization:kYelpKey];
    yelpAPI.delegate = self;
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations {
    CLLocation *lastLocation = [locations lastObject];
    self.mapView.region = MKCoordinateRegionMake(lastLocation.coordinate, MKCoordinateSpanMake(0.03, 0.03));
    [yelpAPI requestSearch:@"cafe" withLatitude:@"49.281815" andLongitude:@"-123.108414"];
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error {
    
}

- (void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status {
    if(status == kCLAuthorizationStatusAuthorizedAlways || status == kCLAuthorizationStatusAuthorizedWhenInUse) {
        [locationManager requestLocation];
    }
}

-(void)onResults:(NSDictionary *)results{
    for(NSDictionary *business in results) {
        Cafe *cafe = [[Cafe alloc] initWithIdentifier:business[@"id"]];
        cafe.title = business[@"name"];
        NSNumber *latitude = business[@"coordinates"][@"latitude"];
        NSNumber *longitude = business[@"coordinates"][@"longitude"];
        cafe.coordinate = CLLocationCoordinate2DMake([latitude doubleValue], [longitude doubleValue]);
        [cafes addObject:cafe];
    }
    [self.mapView addAnnotations:cafes];
    [self.mapView showAnnotations:cafes animated:YES];
}

@end
