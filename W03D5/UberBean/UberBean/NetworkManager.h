////  NetworkManager.h
// Created: 2019-06-15
//


#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^CompletionBlock)(id JSON);

@interface NetworkManager : NSObject



+(NSMutableURLRequest *)createRequestFromUrlString:(NSString *) urlString;
+ (void)makeJSONRequestWithUrl:(NSString *)stringURL onCompletionCall:(CompletionBlock) callback;

+(void)makeJSONRequest:(NSURLRequest *) request onCompletionCall:(CompletionBlock) callback;
@end

NS_ASSUME_NONNULL_END
