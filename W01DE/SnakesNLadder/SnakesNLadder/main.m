//
//  main.m
//  SnakesNLadder
//
//  Created by Arun on 2019-06-02.
//  Copyright © 2019 LogicIO. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Player.h"
#import "InputHandler.h"

static NSString const *welcome = @"Let's play Snakes & Ladders --- ###\n>>> ";
static NSString const *menu = @"Type roll (or r) to roll.\nquit (or q) to quit.\nmenu (or m) for this menu.\n>>> ";

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        Player *player = [Player new];
        InputHandler *console = [InputHandler new];
        
        BOOL crossesFinish = NO;
        
        NSLog(@"%@",welcome);
         NSLog(@"%@",menu);
        while(!crossesFinish) {
           
            NSString *input = [console captureInputFromConsole];
            if( [input isEqualToString:@"roll"] || [input isEqualToString:@"r"]) {
                
                NSUInteger rollValue = [player roll];
                NSLog(@"You rolled a %lu",rollValue);
                
                switch([player move:rollValue]) {
                    case None:
                        NSLog(@"You landed on %lu",player.currentSquare);
                        break;
                    case Snakes:
                        NSLog(@"Snakes ---- You moved from %lu to  %lu",player.eventSquare,player.currentSquare);
                        break;
                    case Ladder:
                        NSLog(@"Ladders ### You moved from %lu to  %lu",player.eventSquare,player.currentSquare);
                        break;
                    case Finish:
                        NSLog(@"Home +++ You crossed the finishing line in %lu moves", player.numberOfRolls);
                        crossesFinish = YES;
                        break;
                    default:
                        NSLog(@"Game Error! Debug");
                        break;
                }
            }
            else if( [input isEqualToString:@"quit"] || [input isEqualToString:@"q"]) {
                break;
            }
            else if( [input isEqualToString:@"menu"] || [input isEqualToString:@"m"]) {
                NSLog(@"%@",menu);
            }
            else {
                NSLog(@"Sorry I don't recognize that command.");
                NSLog(@"%@",menu);
            }
        }
        NSLog(@"Game over!");
    }
    return 0;
}
