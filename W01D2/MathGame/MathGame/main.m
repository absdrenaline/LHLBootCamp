//
//  main.m
//  MathGame
//
//  Created by Arun on 2019-05-28.
//  Copyright © 2019 LogicIO. All rights reserved.
//

#import <Foundation/Foundation.h>
#include "AdditionQuestion.h"
#include "InputHandler.h"
#include "ScoreKeeper.h"

static const uint kMaxInputSize = 5;
static const uint kMinGameNumber = 10;
static const uint kMaxGameNumber = 100;


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        ScoreKeeper *scoreKeeper = [ScoreKeeper new];
        BOOL gameOn = YES;
        
        while (gameOn) {
            
            AdditionQuestion* additionQuestion = [[AdditionQuestion alloc]
                                                  initWithNumberRange:kMinGameNumber
                                                  MaxNumber:kMaxGameNumber];
            
            NSLog(@"%@",[additionQuestion question]);

            InputHandler* inputHandler = [[InputHandler alloc] initWithBufferSize:kMaxInputSize];
            [inputHandler captureInputFromConsole];
            
            if (inputHandler.isQuit) {
                gameOn = NO;
                continue;
            }
            
            if ([inputHandler.inputString isEqualToString: additionQuestion.answer])
            {
                NSLog(@"Right!");
                [scoreKeeper registerWin];
                
            } else {
                NSLog(@"Wrong!");
                [scoreKeeper registerLoss];
            }
            NSLog(@"%.1fs",additionQuestion.answerTime);
            NSLog(@"%@",scoreKeeper);
            
        }
    }
    return 0;
}
