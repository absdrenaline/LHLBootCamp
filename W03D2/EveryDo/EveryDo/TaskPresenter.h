////  TaskPresenter.h
// Created: 2019-06-11
//


#import <Foundation/Foundation.h>
@class Task;
NS_ASSUME_NONNULL_BEGIN

@interface TaskPresenter : NSObject

@property (nonatomic, strong) NSMutableArray <Task *> *tasks;
+(TaskPresenter *)defaultTaskPresenter;
@end

NS_ASSUME_NONNULL_END
