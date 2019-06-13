////  ImageService.h
// Created: 2019-06-12
//


#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ImageService : NSObject

@property (nonatomic, strong) NSArray* images;
+(ImageService *)defaultInstance;

@end

NS_ASSUME_NONNULL_END
