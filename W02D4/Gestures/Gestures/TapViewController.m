//
//  TapViewController.m
//  Gestures
//
//  Created by Arun on 2019-06-06.
//  Copyright © 2019 LogicIO. All rights reserved.
//

#import "TapViewController.h"

@interface TapViewController ()

@end

@implementation TapViewController

- (void)viewDidLoad {
    CGFloat tapSquareHeight = 100, tapSquareWidth = 100;
    
    CGRect tapSquareRect = CGRectMake(CGRectGetMidX(self.view.bounds) -  tapSquareWidth/2, CGRectGetMidY(self.view.bounds) - tapSquareHeight/2, tapSquareHeight,tapSquareWidth);
    
    UIView *tapSquare = [[UIView alloc] initWithFrame:tapSquareRect];
    tapSquare.backgroundColor = [UIColor orangeColor];
    
    [self.view addSubview:tapSquare];
    
    UITapGestureRecognizer* tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tappedSquare:)];
    [tapSquare addGestureRecognizer:tapGestureRecognizer];
}

-(void)tappedSquare:(UITapGestureRecognizer *)sender {
    sender.view.backgroundColor = [sender.view.backgroundColor isEqual: [UIColor purpleColor]] ? [UIColor orangeColor] : [UIColor purpleColor];

}

@end
