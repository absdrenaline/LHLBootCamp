////  YelpAPI.h
// Created: 2019-06-15
//


#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol APIDelegate <NSObject>

-(void)onResults:(NSDictionary *) results;

@end

@interface YelpAPI : NSObject

-(instancetype) initWithAuthorization:(NSString *) apiKey;
- (void) requestSearch:(NSString*) term
          withLatitude:(NSString *) latitude
          andLongitude:(NSString *) longitude;

@property (nonatomic, weak) id<APIDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
