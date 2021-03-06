//
//  AdditionQuestion.m
//  MathGame
//
//  Created by Arun on 2019-05-28.
//  Copyright © 2019 LogicIO. All rights reserved.
//

#import "Question.h"

@implementation Question


- (instancetype)initWithNumbers:(int) firstNumber
                  AnotherNumber:(int) secondNumber
{
    self = [super init];
    if (self) {
        _leftValue = firstNumber;
        _rightValue = secondNumber;
        [self generateQuestion];
        /*
        _question = [NSString stringWithFormat:@"%d + %d ? ", firstNumber, secondNumber];
        _answer = [NSString stringWithFormat:@"%d", firstNumber + secondNumber];
         */
        _startTime = [NSDate date];
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

- (void) generateQuestion {
    NSLog(@"Base Generate Question called");

}

- (NSString *)answer {
    _endTime = [NSDate date];
    return _answer;
}

- (NSTimeInterval)answerTime {
   return [self.endTime timeIntervalSinceDate:self.startTime];
}

@end
