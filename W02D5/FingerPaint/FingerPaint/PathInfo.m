//
//  PathInfo.m
//  FingerPaint
//
//  Created by Arun on 2019-06-07.
//  Copyright © 2019 LogicIO. All rights reserved.
//

#import "PathInfo.h"

@implementation PathInfo

- (instancetype)initWithColor: (UIColor *) color
{
    self = [super init];
    if (self) {
        _path = [UIBezierPath new];
        _color = color;
    }
    return self;
}
@end
