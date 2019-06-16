////  ViewController4.m
// Created: 2019-06-16
//


#import "ViewController4.h"
#import "CustomView.h"

@interface ViewController4 ()
@property (weak, nonatomic) IBOutlet UIView *yellowView;
@property (weak, nonatomic) IBOutlet CustomView *whiteView;

@end

@implementation ViewController4

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.whiteView addObserver:self forKeyPath:@"point" options:NSKeyValueObservingOptionNew context:nil];
    
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if ([keyPath isEqualToString:@"point"]) {
        id value = change[NSKeyValueChangeNewKey];
        CGPoint point = ((NSValue *) value).CGPointValue;
        NSLog(@"%@",value);
        self.yellowView.frame = CGRectOffset(self.yellowView.frame, point.x, point.y);
    } else {
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
