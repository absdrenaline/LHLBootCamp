////  Cafe.m
// Created: 2019-06-15
//


#import "Cafe.h"

@implementation Cafe

-(instancetype) initWithIdentifier:(NSString *) identifier {
    self = [super init];
    if(self) {
        _identifier = identifier;
    }
    return self;
}

@end
