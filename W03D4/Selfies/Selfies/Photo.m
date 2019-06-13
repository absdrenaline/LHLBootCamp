////  Photo.m
// Created: 2019-06-13
//


#import "Photo.h"

@implementation Photo {
    NSDictionary *_flickrPhotoProperties;
}


- (instancetype)initWithDictionary:(NSDictionary *)flickrPhotoProperties
{
    self = [super init];
    if (self) {
        _flickrPhotoProperties = flickrPhotoProperties;
    }
    return self;
}

+ (instancetype)parseJSONDictionary:(NSDictionary *)json {
    return [[Photo alloc] initWithDictionary:json];
}

@end
