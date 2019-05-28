//
//  AdditionQuestion.m
//  MathGame
//
//  Created by Arun on 2019-05-28.
//  Copyright © 2019 LogicIO. All rights reserved.
//

#import "AdditionQuestion.h"

@implementation AdditionQuestion


- (instancetype)initWithNumbers:(int) firstNumber
                  AnotherNumber:(int) secondNumber
{
    self = [super init];
    if (self) {
        _question = [NSString stringWithFormat:@"%d + %d ? ", firstNumber, secondNumber];
        _answer = [NSString stringWithFormat:@"%d", firstNumber + secondNumber];
    }
    return self;
}

- (instancetype)initWithNumberRange:(int)rangeMinNumber MaxNumber:(int) rangeMaxNumber {
    int maxNumber = rangeMaxNumber - rangeMinNumber;
    int numberOne = rangeMinNumber + arc4random_uniform(maxNumber);
    int numberTwo = rangeMinNumber + arc4random_uniform(maxNumber);
    return [self initWithNumbers:numberOne AnotherNumber:numberTwo];
}

- (instancetype)init {
    return [self initWithNumberRange:0 MaxNumber:100];
}

@end
