//
//  PlayerManager.m
//  SnakesNLadder
//
//  Created by Arun on 2019-06-02.
//  Copyright © 2019 LogicIO. All rights reserved.
//

#import "PlayerManager.h"
#import "Player.h"

@implementation PlayerManager {
    NSMutableArray *players;
    NSUInteger currentPlayerIndex;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        players = [NSMutableArray array];
        currentPlayerIndex = 0;
    }
    return self;
}

- (NSUInteger)playerCount {
    return [players count];
}

- (void)createPlayers:(NSUInteger)count { 
    for(int i=1; i <= count; i++) {
        NSString *playerName = [NSString stringWithFormat:@"player%i",i ];
        Player* player = [Player new];
        player.name = playerName;
        [players addObject:player];
    }
}

- (void)roll {
    Player *currentPlayer = players[currentPlayerIndex];
    
    NSUInteger rollValue = [currentPlayer roll];
    NSLog(@"%@ rolled a %lu",[currentPlayer name],rollValue);
    
    switch([currentPlayer move:rollValue]) {
        case None:
            NSLog(@"%@ landed on %lu",[currentPlayer name],currentPlayer.currentSquare);
            break;
        case Snakes:
            NSLog(@"Snakes ---- %@ moved from %lu to  %lu",[currentPlayer name],currentPlayer.eventSquare,currentPlayer.currentSquare);
            break;
        case Ladder:
            NSLog(@"Ladders ### %@ moved from %lu to  %lu",[currentPlayer name],currentPlayer.eventSquare,currentPlayer.currentSquare);
            break;
        case Finish:
            NSLog(@"Home +++ %@ crossed the finishing line in %lu moves", [currentPlayer name], currentPlayer.numberOfRolls);
            NSLog(@"%@",[self score]);
            NSLog(@"%@ is the winner!",[currentPlayer name]);
            [players removeAllObjects];
            //[players removeObject:currentPlayer];
            //crossesFinish = YES;
            break;
        default:
            NSLog(@"Game Error! Debug");
            break;
    }
    if ([players count])
        currentPlayerIndex = (currentPlayerIndex + 1) % [players count];
}

- (NSString *)score {
    if ([players count] == 0)
        return @"";
    
    NSMutableString *scoreString = [NSMutableString stringWithString:@"Score: "];
    for(Player *player in players) {
        [scoreString appendString:[player score]];
        if (player != [players lastObject]) {
            [scoreString appendString:@", "];
        }
    }
    
    return scoreString;
}

- (void)reset {
    [players removeAllObjects];
}

@end
