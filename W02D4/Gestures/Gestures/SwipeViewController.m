//
//  SwipeViewController.m
//  Gestures
//
//  Created by Arun on 2019-06-06.
//  Copyright © 2019 LogicIO. All rights reserved.
//

#import "SwipeViewController.h"

@interface SwipeViewController ()

@end

@implementation SwipeViewController {
    BOOL isSwipped;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGFloat swipeBaseHeight = 50, swipeBaseWidth = CGRectGetWidth(self.view.bounds) - 30;
    
    CGRect swipeBaseRect = CGRectMake(CGRectGetMidX(self.view.bounds) -  swipeBaseWidth/2, CGRectGetMidY(self.view.bounds) - swipeBaseHeight/2, swipeBaseWidth,swipeBaseHeight);
    
    UIView *swipeBase = [[UIView alloc] initWithFrame:swipeBaseRect];
    swipeBase.backgroundColor = [UIColor brownColor];
    swipeBase.clipsToBounds = YES;
    
    [self.view addSubview:swipeBase];
    
    UIView *swipeTop = [[UIView alloc] initWithFrame:CGRectMake(0,0,swipeBaseWidth,50)];
    swipeTop.backgroundColor = [UIColor whiteColor];
    
    [swipeBase addSubview:swipeTop];
   
    UISwipeGestureRecognizer* swipeGestureRecognizerLeft = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swippedTopLayer:)];
    swipeGestureRecognizerLeft.direction = UISwipeGestureRecognizerDirectionLeft;
    
    [swipeTop addGestureRecognizer:swipeGestureRecognizerLeft];
    
    UISwipeGestureRecognizer* swipeGestureRecognizerRight = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swippedTopLayer:)];
    swipeGestureRecognizerRight.direction = UISwipeGestureRecognizerDirectionRight;
    
    [swipeTop addGestureRecognizer:swipeGestureRecognizerRight];
    
    isSwipped = NO;

    
}

-(void)swippedTopLayer:(UISwipeGestureRecognizer*) sender  {

    CGPoint centerPoint = sender.view.center;
   
    switch (sender.direction) {
        case UISwipeGestureRecognizerDirectionLeft:
            if(!isSwipped) {
                centerPoint.x-=50;
                sender.view.center = centerPoint;
                isSwipped = YES;
            }
            break;
        case UISwipeGestureRecognizerDirectionRight:
            if(isSwipped) {
                centerPoint.x+=50;
                sender.view.center = centerPoint;
                isSwipped = NO;
            }
            break;

        case UISwipeGestureRecognizerDirectionUp:
            
            break;
        case UISwipeGestureRecognizerDirectionDown:
            break;
        default:
            break;
    }
}


@end
