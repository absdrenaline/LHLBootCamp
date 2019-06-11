////  DetailedViewController.m
// Created: 2019-06-10
//


#import "DetailedViewController.h"

@interface DetailedViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *detailedScrollView;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation DetailedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIImage* image = [UIImage imageNamed:self.imageName];
    self.imageView.image = image;
    
    self.detailedScrollView.contentSize = self.imageView.frame.size;
    self.detailedScrollView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    self.detailedScrollView.minimumZoomScale = self.detailedScrollView.frame.size.height/self.imageView.image.size.height;
    self.detailedScrollView.maximumZoomScale = 1;
    self.detailedScrollView.zoomScale = self.detailedScrollView.minimumZoomScale;
}

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    return self.imageView;
}

@end
