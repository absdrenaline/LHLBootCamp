//
//  DivisionQuestion.m
//  MathGame
//
//  Created by Arun on 2019-05-29.
//  Copyright © 2019 LogicIO. All rights reserved.
//

#import "DivisionQuestion.h"

@implementation DivisionQuestion

- (void)generateQuestion {
    
    super.question = [NSString stringWithFormat:@"%d / %d ?", super.leftValue, super.rightValue];
    super.answer = [NSString stringWithFormat:@"%.1f", (float) super.leftValue / super.rightValue];
}


@end
