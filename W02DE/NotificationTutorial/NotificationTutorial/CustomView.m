////  CustomView.m
// Created: 2019-06-16
//


#import "CustomView.h"

@implementation CustomView

- (IBAction)viewDidPan:(UIPanGestureRecognizer *)sender {
    self.point = [sender translationInView:sender.view.superview];
    [sender setTranslation:CGPointZero inView:self];
}

@end
