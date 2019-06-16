////  Cafe.h
// Created: 2019-06-15
//


#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Cafe : NSObject

@property (nonatomic, copy) NSString *identifier;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *latitude;
@property (nonatomic, copy) NSString *longitude;

-(instancetype) initWithIdentifier:(NSString *) identifier;

@end

NS_ASSUME_NONNULL_END
