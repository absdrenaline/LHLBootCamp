////  ViewController3.m
// Created: 2019-06-09
//


#import "ViewController3.h"

@interface ViewController3 ()
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bottomConstraint;

@property (nonatomic, readonly) CGFloat oldConstraint;

@end

@implementation ViewController3

- (void)viewDidLoad {
    [super viewDidLoad];
    NSNotificationCenter *defaultNC = [NSNotificationCenter defaultCenter];
    [defaultNC addObserver:self selector:@selector(keyboardChanged:) name:UIKeyboardWillChangeFrameNotification object:nil];
    _oldConstraint = _bottomConstraint.constant;
}

- (void) keyboardChanged:(NSNotification*) notification {
    NSValue* value= notification.userInfo[UIKeyboardFrameEndUserInfoKey];
    CGRect keyRect = value.CGRectValue;

    CGFloat yPos = keyRect.origin.y;
    CGFloat mainViewHeight = self.view.bounds.size.height;
    if(yPos >= mainViewHeight) {
        self.bottomConstraint.constant = _oldConstraint;
    } else {
        self.bottomConstraint.constant = mainViewHeight -yPos;
    }
    [self.view layoutSubviews];
}


@end
