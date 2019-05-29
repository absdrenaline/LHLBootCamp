//
//  main.m
//  MathGame
//
//  Created by Arun on 2019-05-28.
//  Copyright © 2019 LogicIO. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Question.h"
#import "QuestionFactory.h"
#import "QuestionManager.h"
#import "ScoreKeeper.h"
#import "InputHandler.h"

static const uint kMaxInputSize = 7;

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        ScoreKeeper *scoreKeeper = [ScoreKeeper new];
        QuestionFactory *questionFactory = [QuestionFactory new];
        QuestionManager *questionManager = [QuestionManager new];
        
        BOOL gameOn = YES;
        
        while (gameOn) {
            
            Question* question = [questionFactory generateRandomQuestion];
            NSLog(@"%@",[question question]);

            InputHandler* inputHandler = [[InputHandler alloc] initWithBufferSize:kMaxInputSize];
            [inputHandler captureInputFromConsole];
            
            if (inputHandler.isQuit) {
                gameOn = NO;
                continue;
            }
            
            if ([inputHandler.inputString isEqualToString: question.answer])
            {
                NSLog(@"Right!");
                [scoreKeeper registerWin];
                
            } else {
                NSLog(@"Wrong!");
                [scoreKeeper registerLoss];
            }
            [questionManager.questions addObject:question];
            NSLog(@"%@",[questionManager timeOutput]);
            NSLog(@"%@",scoreKeeper);
        }
    }
    return 0;
}
