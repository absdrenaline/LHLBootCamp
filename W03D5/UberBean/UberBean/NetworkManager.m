////  NetworkManager.m
// Created: 2019-06-15
//



//#import <UIKit/UIKit.h>
#import "NetworkManager.h"

@implementation NetworkManager


+(NSMutableURLRequest *)createRequestFromUrlString:(NSString *) urlString {
    NSURL *url = [NSURL URLWithString:urlString];
    return [NSMutableURLRequest requestWithURL:url];
}

+(void)makeJSONRequestWithUrl:(NSString *) urlString onCompletionCall:(CompletionBlock) callback {
    NSURLRequest* request = [NetworkManager createRequestFromUrlString:urlString];
    [NetworkManager makeJSONRequest:request onCompletionCall:callback];
}

+(void)makeJSONRequest:(NSURLRequest *) request onCompletionCall:(CompletionBlock) callback {
    
    NSURLSessionDataTask *task = [[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            NSLog(@"Got an error! %@", error);
            return;
        }
        
        NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
        if (httpResponse.statusCode != 200) {
            NSLog(@"Server responded with a non 200 status");
            return;
        }
        
        NSError *jsonError;
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
        
        if (jsonError) {
            NSLog(@"Error parsing the JSON response: %@", jsonError);
            return;
        }
        
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            callback(json);
        }];
    }];
    [task resume];
}
@end
