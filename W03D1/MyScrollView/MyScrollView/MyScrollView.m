////  MyScrollView.m
// Created: 2019-06-10
//


#import "MyScrollView.h"

@implementation MyScrollView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        UIPanGestureRecognizer* panGestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(viewDidPan:)];
        [self addGestureRecognizer:panGestureRecognizer];
    }
    return self;
}

-(void)viewDidPan:(UIPanGestureRecognizer *)gesture {
    CGPoint translationInView  = [gesture translationInView:self];
    //CGRect newRect = CGRectOffset(self.frame, translationInView.x, translationInView.y);
    NSLog(@"Translation: %@", NSStringFromCGPoint(translationInView));
    NSLog(@"%@", NSStringFromCGRect(self.frame));
    
    if ((self.frame.size.height - self.frame.origin.y - translationInView.y) > self.contentSize.height) {
        NSLog(@"Out of Bound on height");
        [gesture setTranslation:CGPointZero inView:self];
        return;
    }

    
    if ((self.frame.size.width - self.frame.origin.x - translationInView.x) > self.contentSize.width) {
        NSLog(@"Out of Bounds on Width");
        [gesture setTranslation:CGPointZero inView:self];
        return;
    }
    
  
    
    CGPoint oldCenter = gesture.view.center;
    CGPoint newCenter = CGPointMake(oldCenter.x + translationInView.x, oldCenter.y + translationInView.y);
    
    [gesture setTranslation:CGPointZero inView:self];
    
    gesture.view.center = newCenter;
    
}
@end
