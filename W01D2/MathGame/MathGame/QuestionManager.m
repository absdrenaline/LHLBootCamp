//
//  QuestionManager.m
//  MathGame
//
//  Created by Arun on 2019-05-29.
//  Copyright © 2019 LogicIO. All rights reserved.
//

#import "QuestionManager.h"
#import "Question.h"

@implementation QuestionManager

- (instancetype)init
{
    self = [super init];
    if (self) {
        _questions = [[NSMutableArray alloc] initWithCapacity:10];
    }
    return self;
}

- (NSString *)timeOutput {
    float totalTime = 0;
    
    for(Question *question in _questions) {
        totalTime += [question answerTime];
    }
    
    return [NSString stringWithFormat:@"total time: %.1fs, average time: %.1fs",totalTime,totalTime/[_questions count]];
}

@end
