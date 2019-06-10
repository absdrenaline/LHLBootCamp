////  ViewController2.m
// Created: 2019-06-09
//


#import "ViewController2.h"

@interface ViewController2 ()
@property (weak, nonatomic) IBOutlet UILabel *counterLabel;

@end

@implementation ViewController2

- (void)viewDidLoad {
    [super viewDidLoad];
    NSNotificationCenter* defaultNC = [NSNotificationCenter defaultCenter];
    [defaultNC addObserver:self selector:@selector(doNotifiedByStepper:) name:@"StepperNotification" object:nil];
}

-(void)doNotifiedByStepper:(NSNotification *) notification {
    NSNumber *stepperValue = notification.userInfo[@"stepperValue"];
    self.counterLabel.text = [stepperValue stringValue];
}
@end
