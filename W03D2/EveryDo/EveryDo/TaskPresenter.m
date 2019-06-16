////  TaskPresenter.m
// Created: 2019-06-11
//


#import "TaskPresenter.h"
#import "Task.h"

@interface TaskPresenter()

@end

@implementation TaskPresenter
static TaskPresenter *_taskPresenter;

- (instancetype)init
{
    self = [super init];
    if (self) {
        _tasks = [NSMutableArray new];
    }
    return self;
}

-(void) loadDummies {
    NSArray *dummies = @[
     [[Task alloc] initWithTitle:@"Hire Truck" andDetail:@"Hire a truck from U-Haul"  andPriority:1 andIsComplete:NO],
     [[Task alloc] initWithTitle:@"Visit Ikea" andDetail:@"Located at Coquitlam"  andPriority:2 andIsComplete:NO],
     [[Task alloc] initWithTitle:@"Buy a sofa set" andDetail:@"Pay by Mastercard"  andPriority:3 andIsComplete:NO],
     [[Task alloc] initWithTitle:@"Schedule a delivery" andDetail:@"June 23 - June 26"  andPriority:4 andIsComplete:NO],
    ];
    _tasks = [dummies mutableCopy];
}

+(TaskPresenter *)defaultTaskPresenter {
    if (_taskPresenter == nil) {
        _taskPresenter = [TaskPresenter new];
        [_taskPresenter loadDummies];
    }
    return _taskPresenter;
}


@end
