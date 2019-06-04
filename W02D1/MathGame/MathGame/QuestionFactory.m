//
//  QuestionFactory.m
//  MathGame
//
//  Created by Arun on 2019-05-29.
//  Copyright © 2019 LogicIO. All rights reserved.
//

#import "QuestionFactory.h"
#import "Question.h"
#import "AdditionQuestion.h"
#import "SubtractionQuestion.h"
#import "MultiplicationQuestion.h"
#import "DivisionQuestion.h"

static const uint kMinGameNumber = 1;
static const uint kMaxGameNumber = 20;

@implementation QuestionFactory

- (Question *)generateRandomQuestion {
    
    NSArray *questionSubclassNames = @[@"AdditionQuestion",
                                       @"SubtractionQuestion",
                                       @"MultiplicationQuestion",
                                       @"DivisionQuestion"
                                       ];
    
    uint randomIndex = arc4random_uniform((uint)[questionSubclassNames count]);
    NSString* randomClassName = questionSubclassNames[randomIndex];
    
    return [[NSClassFromString(randomClassName) alloc]
            initWithNumberRange:kMinGameNumber
            MaxNumber:kMaxGameNumber];

}
@end
