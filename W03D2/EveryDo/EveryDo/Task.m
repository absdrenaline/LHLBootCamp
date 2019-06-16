////  Task.m
// Created: 2019-06-11
//


#import "Task.h"

@implementation Task

- (instancetype)initWithTitle: (NSString *) title
                   andDetail: (NSString *) detail
                 andPriority: (NSInteger) priority
               andIsComplete: (BOOL) isComplete
{
    self = [super init];
    if (self) {
        _title = [title copy];
        _detail = [detail copy];
        _priority = priority;
        _isComplete = isComplete;
    }
    return self;
}

@end
