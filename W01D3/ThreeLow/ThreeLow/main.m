//
//  main.m
//  ThreeLow
//
//  Created by Arun on 2019-05-30.
//  Copyright © 2019 LogicIO. All rights reserved.
//

#import <Foundation/Foundation.h>
//#include "Dice.h"
#import "GameController.h"
#import "InputHandler.h"

static char const kGameMenu[] = "Enter your move [roll hold/unhold reset quit]";
static char const kGamePrompt[] = ">>>";
static char const kGameHoldDiceWarn[] = "⚠️ Hold at least one dice to continue";
static char const kGameNoMovesWarn[] = "⚠️ No more moves remaining. Please reset";
static char const kGameHoldSyntax[] = "holds (or unholds) a dice\n"
                                      "hold [dice number] [dice number] ...\n"
                                      "E.g. hold 3 4\n";
static char const kGameChangePlayersMessage[] = "🏆 Change Players!";



NSArray* getCommandArgs(NSString* commandLine) {
    return [commandLine
            componentsSeparatedByCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        GameController* game = [GameController new];
        InputHandler* inputHandler = [InputHandler new];

        do {
            [game print];
            printf("%s\n",kGameMenu);
            printf("%s ",kGamePrompt);
            NSString *commandLine = [inputHandler captureInputFromConsole];
            NSArray *commandArgs = getCommandArgs(commandLine);
            
            NSString *command = [commandArgs[0] lowercaseString];
            if([command isEqualToString:@"quit"]) {
                break;
            }
            else if ([command isEqualToString:@"roll"]) {
                if ([game shouldRoll]) {
                    [game roll];
                }
                else {
                    if ([game availableMoves] > 0) {
                        printf("%s\n",kGameHoldDiceWarn);
                    }
                    else {
                        printf("%s\n",kGameNoMovesWarn);
                    }
                    [inputHandler waitOn];
                }
            }
            else if ([command isEqualToString:@"hold"]) {
                if ([commandArgs count] > 1) {
                    for(int i=1; i < [commandArgs count]; i++) {
                        [game holdDice:[commandArgs[i] intValue]];
                    }
                }
                else {
                    printf("%s",kGameHoldSyntax);
                    [inputHandler waitOn];
                }
            }
            else if ([command isEqualToString:@"reset"]) {
                printf("%s\n",kGameChangePlayersMessage);
                [game resetDice];
                [inputHandler waitOn];
            }
        } while (YES);
    }
    return 0;
}
