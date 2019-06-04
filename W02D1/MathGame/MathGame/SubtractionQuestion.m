//
//  SubtractionQuestion.m
//  MathGame
//
//  Created by Arun on 2019-05-29.
//  Copyright © 2019 LogicIO. All rights reserved.
//

#import "SubtractionQuestion.h"

@implementation SubtractionQuestion

- (void)generateQuestion {
    
    super.question = [NSString stringWithFormat:@"%d - %d ? ", super.leftValue, super.rightValue];
    super.answer = [NSString stringWithFormat:@"%d", super.leftValue - super.rightValue];
}

@end
