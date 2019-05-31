//
//  Dice.m
//  ThreeLow
//
//  Created by Arun on 2019-05-30.
//  Copyright © 2019 LogicIO. All rights reserved.
//

#import "Dice.h"

@implementation Dice {
    UInt max;
    UInt min;
}

+(NSString *)symbolFromValue:(UInt) value {
    NSArray* symbolArray = @[@"0️⃣",@"1️⃣",@"2️⃣",
                            @"3️⃣",@"4️⃣",@"5️⃣",
                            @"6️⃣",@"7️⃣",@"8️⃣",
                            @"9️⃣",@"🔟",@"*️⃣"];
    if(value > 0 && value < ([symbolArray count] - 1)) {
        return symbolArray[value];
    } else {
        return [symbolArray lastObject];
    }
}

- (instancetype)initWithMax:(UInt)maxValue andMin:(UInt)minValue
{
    self = [super init];
    if (self) {
        max = maxValue;
        min = minValue;
        [self roll];
    }
    return self;
}

- (instancetype) init {
    return [self initWithMax:6 andMin:1];
}

- (void)roll {
    UInt random = arc4random_uniform(max - min);
    _value = random + min;
    _valueSymbol = [Dice symbolFromValue:_value];
    
}

@end
