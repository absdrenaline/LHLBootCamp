////  ViewController.m
// Created: 2019-06-16
//


#import "ViewController.h"


@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *iPhoneImageView;

@end

@implementation ViewController {
    NSArray<NSString *> *iPhoneImageUrls;
}

- (void)loadImage:(NSString *) imageUrl {
    NSURL *url = [NSURL URLWithString:imageUrl];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    NSURLSessionDownloadTask *downloadTask = [session downloadTaskWithURL:url completionHandler:^(NSURL * _Nullable location, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) { // 1
            // Handle the error
            NSLog(@"error: %@", error.localizedDescription);
            return;
        }
        
        NSData *data = [NSData dataWithContentsOfURL:location];
        UIImage *image = [UIImage imageWithData:data]; // 2
        
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            // This will run on the main queue
            
            self.iPhoneImageView.image = image; // 4
        }];
    }];
    [downloadTask resume];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    iPhoneImageUrls = @[
                         @"http://imgur.com/bktnImE.png",
                         @"http://imgur.com/zdwdenZ.png",
                         @"http://imgur.com/CoQ8aNl.png",
                         @"http://imgur.com/2vQtZBb.png",
                         @"http://imgur.com/y9MIaCS.png"
                         ];
    
    [self loadImage:iPhoneImageUrls[0]];
}

- (IBAction)showAnotherPhone:(id)sender {
    NSUInteger randomIndex = arc4random_uniform((uint)iPhoneImageUrls.count);
    [self loadImage:iPhoneImageUrls[randomIndex]];
    
    
}

@end
