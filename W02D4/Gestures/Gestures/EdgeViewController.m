//
//  EdgeViewController.m
//  Gestures
//
//  Created by Arun on 2019-06-06.
//  Copyright © 2019 LogicIO. All rights reserved.
//

#import "EdgeViewController.h"

@interface EdgeViewController ()

@end

@implementation EdgeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)edgeMoved:(UIScreenEdgePanGestureRecognizer *)sender {
    
    NSLog(@"Edge Gesture Detected");
    CGPoint translationInView  = [sender translationInView:self.view];
    
    CGPoint oldCenter = sender.view.center;
    CGPoint newCenter = CGPointMake(oldCenter.x + translationInView.x, oldCenter.y + translationInView.y);
    
    [sender setTranslation:CGPointZero inView:self.view];
    
    sender.view.center = newCenter;
}

@end
