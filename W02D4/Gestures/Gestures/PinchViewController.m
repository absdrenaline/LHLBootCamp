//
//  PinchViewController.m
//  Gestures
//
//  Created by Arun on 2019-06-06.
//  Copyright © 2019 LogicIO. All rights reserved.
//

#import "PinchViewController.h"

@interface PinchViewController ()

@end

@implementation PinchViewController
- (void)viewDidLoad {
    
    CGFloat yellowSquareHeight = 100, yellowSquareWidth = 100;
    
    CGRect yellowSquareRect = CGRectMake(CGRectGetMidX(self.view.bounds) -  yellowSquareWidth/2, CGRectGetMidY(self.view.bounds) - yellowSquareHeight/2, yellowSquareHeight,yellowSquareWidth);
    
    UIView *yellowSquare = [[UIView alloc] initWithFrame:yellowSquareRect];
    yellowSquare.backgroundColor = [UIColor yellowColor];
    
    [self.view addSubview:yellowSquare];
    
    UIPinchGestureRecognizer* pinchGestureRecognizer = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(viewPinched:)];
    [yellowSquare addGestureRecognizer:pinchGestureRecognizer];
    
}

-(void)viewPinched:(UIPinchGestureRecognizer *)sender {
    sender.view.transform = CGAffineTransformMakeScale(sender.scale, sender.scale);
}
@end
