////  ImageService.m
// Created: 2019-06-12
//

#import <UIKit/UIKit.h>
#import "ImageService.h"

@implementation ImageService

static ImageService*  _instance;

- (instancetype)init
{
    self = [super init];
    if (self) {
        NSMutableArray *summerImages = [NSMutableArray array];
        NSArray *summerImagePaths = [[NSBundle mainBundle] pathsForResourcesOfType:@"jpg" inDirectory:@"images/summer"];
        for (NSString* path in summerImagePaths) {
            UIImage* image  = [UIImage imageWithContentsOfFile:path];
            [summerImages addObject:image];
        }
        NSMutableArray *rainyImages = [NSMutableArray array];
        NSArray *rainyImagePaths = [[NSBundle mainBundle] pathsForResourcesOfType:@"jpg" inDirectory:@"images/rainy"];
         for (NSString* path in rainyImagePaths) {
            UIImage* image  = [UIImage imageWithContentsOfFile:path];
            [rainyImages addObject:image];
        };
        self.images = @[summerImages,rainyImages];
    }
    return self;
}

+(ImageService *)defaultInstance {
    
    if (_instance == nil) {
        _instance = [ImageService new];
    }
    
    return _instance;
    
}

@end
