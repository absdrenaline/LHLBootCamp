////  ViewController.m
// Created: 2019-06-10
//


#import "ViewController.h"
#import "MyScrollView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    CGRect rootViewBounds = self.view.bounds;
    
    MyScrollView *scrollView = [[MyScrollView alloc] initWithFrame:rootViewBounds];
    [self.view addSubview:scrollView];
    
    UIView *redBox = [[UIView alloc] initWithFrame:CGRectMake(20, 20, 100, 100)];
    redBox.backgroundColor = [UIColor redColor];
    [scrollView addSubview:redBox];
    
    UIView *greenBox = [[UIView alloc] initWithFrame:CGRectMake(150, 150, 150, 200)];
    greenBox.backgroundColor = [UIColor greenColor];
    [scrollView addSubview:greenBox];
    
    UIView *blueBox = [[UIView alloc] initWithFrame:CGRectMake(40,400, 200, 150)];
    blueBox.backgroundColor = [UIColor blueColor];
    [scrollView addSubview:blueBox];
    
    UIView *yellowBox = [[UIView alloc] initWithFrame:CGRectMake(100,600, 180, 150)];
    yellowBox.backgroundColor = [UIColor yellowColor];
    [scrollView addSubview:yellowBox];
    
    scrollView.contentSize = CGSizeMake(400, 800);
    //NSLog(@"bounds: %@",NSStringFromCGRect(scrollView.bounds));
    
    //self.view.bounds = CGRectOffset(self.view.bounds, 0, 100);
}


@end
