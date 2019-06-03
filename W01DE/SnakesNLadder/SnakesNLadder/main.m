//
//  main.m
//  SnakesNLadder
//
//  Created by Arun on 2019-06-02.
//  Copyright © 2019 LogicIO. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Player.h"
#import "PlayerManager.h"
#import "InputHandler.h"

static NSString const *welcome = @"Let's play Snakes & Ladders --- ###\n";
static NSString const *prompt = @">>>";
static NSString const *menu = @"Type roll (or r) to roll.\nquit (or q) to quit.\nmenu (or m) for this menu.\n";

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        PlayerManager *playerManager = [PlayerManager new];
        InputHandler *console = [InputHandler new];
        
        BOOL gameOn = YES;
        
        NSLog(@"%@",welcome);
      
        
        
        while(gameOn) {
            
            if([playerManager playerCount] <= 0) {
                NSLog(@"How many players will play this game? ");
                NSString* input = [console captureInputFromConsole];
                if ([input intValue] > 0) {
                    [playerManager createPlayers:[input integerValue]];
                      NSLog(@"%@",menu);
                } else {
                    NSLog(@"I didn't understand that. Please input a number\n");
                    continue;
                }
            }
           
            NSLog(@"%@",prompt);
            NSString *input = [console captureInputFromConsole];
            if( [input isEqualToString:@"roll"] || [input isEqualToString:@"r"]) {
                [playerManager roll];
                NSLog(@"%@",[playerManager score]);
            }
            else if( [input isEqualToString:@"quit"] || [input isEqualToString:@"q"]) {
                NSLog(@"Would you like to restart instead of quitting (yes/no)? ");
                if ([[console captureInputFromConsole] isEqualToString:@"yes"]) {
                    [playerManager reset];
                } else {
                    gameOn = NO;
                }
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
