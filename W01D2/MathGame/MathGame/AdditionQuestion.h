//
//  AdditionQuestion.h
//  MathGame
//
//  Created by Arun on 2019-05-28.
//  Copyright © 2019 LogicIO. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface AdditionQuestion : NSObject

@property (nonatomic) int firstNumber;
@property (nonatomic) int secondNumber;
@property (nonatomic, readonly) NSString *question;
@property (nonatomic, readonly) NSString *answer;

- (instancetype)initWithNumbers:(int) firstNumber
                  AnotherNumber:(int) secondNumber
NS_DESIGNATED_INITIALIZER;

- (instancetype)initWithNumberRange:(int)rangeMinNumber MaxNumber:(int) rangeMaxNumber;

@end

NS_ASSUME_NONNULL_END
