//
//  AdditionQuestion.h
//  MathGame
//
//  Created by Arun on 2019-05-28.
//  Copyright © 2019 LogicIO. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Question : NSObject

/**
 The time when the question was provided
 */
@property (nonatomic, readonly) NSDate *startTime;

/**
 The time the solution was provided
 */
@property (nonatomic) NSDate *endTime;

@property (nonatomic,readonly) int leftValue;
@property (nonatomic,readonly) int rightValue;

@property (nonatomic) NSString *question;
@property (nonatomic) NSString *answer;

- (instancetype)initWithNumbers:(int) firstNumber
                  AnotherNumber:(int) secondNumber
NS_DESIGNATED_INITIALIZER;

- (instancetype)initWithNumberRange:(int)rangeMinNumber MaxNumber:(int) rangeMaxNumber;
- (void) generateQuestion;
- (NSString *)answer;
- (NSTimeInterval)answerTime;


@end

NS_ASSUME_NONNULL_END
