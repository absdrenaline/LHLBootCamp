//
//  Player.m
//  MathGame
//
//  Created by Arun on 2019-06-03.
//  Copyright © 2019 LogicIO. All rights reserved.
//

#import "Player.h"

static const NSUInteger kMaxLives = 3;

@implementation Player



- (instancetype)initWithName: (NSString *)name
{
    self = [super init];
    if (self) {
        _name = [name copy];
        _lives = kMaxLives;
    }
    return self;
}
@end
