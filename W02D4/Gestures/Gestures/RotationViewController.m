//
//  RotationViewController.m
//  Gestures
//
//  Created by Arun on 2019-06-06.
//  Copyright © 2019 LogicIO. All rights reserved.
//

#import "RotationViewController.h"

@interface RotationViewController ()

@end

@implementation RotationViewController

- (void)viewDidLoad {
    
    CGFloat yellowSquareHeight = 100, yellowSquareWidth = 100;
    
    CGRect yellowSquareRect = CGRectMake(CGRectGetMidX(self.view.bounds) -  yellowSquareWidth/2, CGRectGetMidY(self.view.bounds) - yellowSquareHeight/2, yellowSquareHeight,yellowSquareWidth);
    
    UIView *yellowSquare = [[UIView alloc] initWithFrame:yellowSquareRect];
    yellowSquare.backgroundColor = [UIColor yellowColor];
    
    [self.view addSubview:yellowSquare];
    
    UIRotationGestureRecognizer* rotationGestureRecognizer = [[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(viewRotated:)];
    [yellowSquare addGestureRecognizer:rotationGestureRecognizer];
    
}

-(void)viewRotated:(UIRotationGestureRecognizer *)sender {
    sender.view.transform = CGAffineTransformMakeRotation(sender.rotation);
}


@end
