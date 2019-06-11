////  ViewController.m
// Created: 2019-06-10
//


#import "ViewController.h"
#import "DetailedViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;

@end

@implementation ViewController {
    NSArray<NSString *> *imagesNames;
}

- (void)viewDidLoad {
    [super viewDidLoad];
 
    if(!imagesNames) {
        imagesNames = @[@"Lighthouse",@"Lighthouse-in-Field",@"Lighthouse-night"];
    }
    for(int i=0; i< [imagesNames count]; i++) {
        UIImage *image = [UIImage imageNamed:imagesNames[i]];
        UIImageView* imageView = [[UIImageView alloc] initWithImage:image];
        imageView.frame = CGRectMake(self.scrollView.frame.size.width*(i), 0, self.scrollView.frame.size.width, self.scrollView.frame.size.height);
        imageView.contentMode = UIViewContentModeScaleAspectFit;
        
        [self.scrollView addSubview:imageView];
    }
    self.scrollView.contentSize = CGSizeMake([imagesNames count]*self.scrollView.frame.size.width, self.scrollView.frame.size.height);
    self.scrollView.pagingEnabled = YES;
    
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onTapImage:)];
    [self.scrollView addGestureRecognizer:tapGestureRecognizer];
}

-(void)onTapImage:(UITapGestureRecognizer *)gesture {
   
    NSInteger imageIndex = self.scrollView.bounds.origin.x/self.scrollView.frame.size.width;
    
    UIStoryboard *main = [UIStoryboard storyboardWithName:@"Main" bundle: nil];
    DetailedViewController *detailedViewController = [main instantiateViewControllerWithIdentifier:@"detailedImageView"];
    detailedViewController.imageName = imagesNames[imageIndex];
    [self.navigationController pushViewController:(detailedViewController) animated:YES];
    
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView {
    self.pageControl.currentPage =  self.scrollView.bounds.origin.x/self.scrollView.frame.size.width;
}
- (IBAction)onPageChange:(UIPageControl *)sender {
    NSInteger page = sender.currentPage;
    CGRect frame = self.scrollView.frame;
    frame.origin.x = frame.size.width * page;
    frame.origin.y = 0;
    [self.scrollView scrollRectToVisible:frame animated:YES];
}
@end
