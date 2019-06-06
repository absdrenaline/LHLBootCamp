//
//  ViewController.m
//  NavigationUI
//
//  Created by Arun on 2019-06-05.
//  Copyright © 2019 LogicIO. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIStackView *stackView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    CGSize viewSize = self.view.bounds.size;
   
    
//    switch( UIDevice.currentDevice.orientation) {
//        case UIDeviceOrientationPortrait:
//        case UIDeviceOrientationPortraitUpsideDown:
//            break;
//        case UIDeviceOrientationLandscapeLeft:
//        case UIDeviceOrientationLandscapeRight:
//            break;
//        default:
//            break;
//
//    }
}

- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator {
    if(size.height > size.width) {
        self.stackView.axis = UILayoutConstraintAxisVertical;
        NSLog(@"Changing orientation to landscape");
    } else {
        self.stackView.axis = UILayoutConstraintAxisHorizontal;
        NSLog(@"Changing orientation to portrait");
    }
}

@end
