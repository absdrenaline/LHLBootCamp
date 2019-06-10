////  UIStackView+Background.m
// Created: 2019-06-09
//


#import "UIStackView+Background.h"

@implementation UIStackView (Background)
-(void)setBackgroundColor:(UIColor *) color {
    UIView *backgroundView = [[UIView alloc] initWithFrame:self.bounds];
    backgroundView.backgroundColor = color;
    backgroundView.layer.cornerRadius = 10;
    backgroundView.translatesAutoresizingMaskIntoConstraints = false;
    
    self.layoutMarginsRelativeArrangement = YES;
    self.layoutMargins = UIEdgeInsetsMake(20, 20, 20, 20);
    
    [self insertSubview:backgroundView atIndex:0];
    
    [NSLayoutConstraint activateConstraints:@[
                                             [backgroundView.topAnchor constraintEqualToAnchor:self.topAnchor],
                                             [backgroundView.leadingAnchor constraintEqualToAnchor: self.leadingAnchor],
                                             [backgroundView.bottomAnchor constraintEqualToAnchor: self.bottomAnchor],
                                             [backgroundView.trailingAnchor constraintEqualToAnchor: self.trailingAnchor]
                                             ]];
    
    
    [self setNeedsLayout];
    
   
    
}
@end
