////  ViewController1.m
// Created: 2019-06-09
//


#import "ViewController1.h"

@interface ViewController1 ()

@property (weak, nonatomic) IBOutlet UIStepper *stepperView;

@end

@implementation ViewController1

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (IBAction)stepperChanged:(UIStepper *)sender {
    NSNotificationCenter *defaultNC = [NSNotificationCenter defaultCenter];
    NSDictionary* infoDictionary = @{@"stepperValue":[NSNumber numberWithDouble:self.stepperView.value]};
    NSNotification* notification = [[NSNotification alloc] initWithName:@"StepperNotification" object:self.stepperView userInfo:infoDictionary];
    [defaultNC postNotification:notification];
    
    
}


@end
