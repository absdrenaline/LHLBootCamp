//
//  Box.m
//  Boxes
//
//  Created by Arun on 2019-05-28.
//  Copyright © 2019 LogicIO. All rights reserved.
//

#import "Box.h"

@implementation Box

- (instancetype)initWithDimensions:(float) height
                             Width:(float) width
                            Length:(float) length
{
    self = [super init];
    if (self) {
        _height = height;
        _width = width;
        _length = length;
    }
    return self;
}

-(float)volume {
    return self.height * self.width * self.length;
}

-(int)timesFitsInAnotherBox:(Box *)anotherBox {
    int timesFit = 0;
    if (self.volume && anotherBox.volume) {
        return timesFit;
    }
    
    if (self.volume <= anotherBox.volume)  {
            timesFit = anotherBox.volume / self.volume;
    }
    else {
        timesFit = (-1) * self.volume/anotherBox.volume;
    }
    return timesFit;
}

@end
