////  YelpAPI.m
// Created: 2019-06-15
//


#import "YelpAPI.h"
#import "NetworkManager.h"


@implementation YelpAPI {
    NSString *_apiKey;
}

static NSString *const searchBaseUrl = @"https://api.yelp.com/v3/businesses/search?";

-(instancetype) initWithAuthorization:(NSString *) apiKey {
    self = [super init];
    if(self) {
        _apiKey = apiKey;
    }
    return self;
}

- (void) requestSearch:(NSString*) term
          withLatitude:(NSString *) latitude
          andLongitude:(NSString *) longitude {
    
    NSString* queryString = [NSString stringWithFormat:@"term=%@&latitude=%@&longitude=%@",term, latitude,longitude];
    
    NSString* url = [searchBaseUrl stringByAppendingString:queryString];
    
    NSLog(@"Search: %@",url);
    
    CompletionBlock completionBlock = ^(id json) {
        [self resultAvailble:(NSDictionary*) json];
    };
    
    NSMutableURLRequest* request = [NetworkManager createRequestFromUrlString:url];
    
    NSString* authorizationHeader = [@"Bearer " stringByAppendingString:_apiKey];
    [request addValue:authorizationHeader forHTTPHeaderField:@"Authorization"];
    
    [NetworkManager makeJSONRequest:request onCompletionCall:completionBlock];
    
}

-(void) resultAvailble:(id) json {
    if([json isKindOfClass:[NSDictionary class]]) {
        NSDictionary *results = (NSDictionary *)json;
        [self.delegate onResults:results[@"businesses"]];
    }
}

@end
