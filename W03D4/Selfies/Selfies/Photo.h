////  Photo.h
// Created: 2019-06-13
//


#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Photo : NSObject
//@property (nonatomic, readonly)

+(instancetype)parseJSONDictionary:(NSDictionary *)json;

@end

NS_ASSUME_NONNULL_END
