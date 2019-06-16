////  Task.h
// Created: 2019-06-11
//


#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Task : NSObject

@property (nonatomic,copy) NSString* title;
@property (nonatomic,copy) NSString* detail;
@property (nonatomic,assign) NSInteger priority;
@property (nonatomic,assign) BOOL isComplete;

- (instancetype)initWithTitle: (NSString *) title
                    andDetail: (NSString *) detail
                  andPriority: (NSInteger) priority
                andIsComplete: (BOOL) isComplete;

@end

NS_ASSUME_NONNULL_END
