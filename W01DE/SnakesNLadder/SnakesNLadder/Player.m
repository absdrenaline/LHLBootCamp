//
//  Player.m
//  SnakesNLadder
//
//  Created by Arun on 2019-06-02.
//  Copyright © 2019 LogicIO. All rights reserved.
//

#import "Player.h"
#import "Dice.h"

@implementation Player {
    NSDictionary* gameLogic;
    Dice* dice;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        gameLogic = @{@4:@14,@9:@31,@20:@38,@28:@84,@40:@59,@51:@67,@63:@81,
                      @17:@7,@64:@60,@89:@26,@95:@75,@99:@78
                      };
        _currentSquare = 0;
        dice = [Dice new];
    }
    return self;
}
- (NSUInteger)roll {
    [dice roll];
    self.numberOfRolls ++;
    return dice.value;
}

- (GameEvent)move:(NSUInteger) length {
    GameEvent gameEvent = None;
    self.eventSquare = self.currentSquare + length;
    
    if( self.eventSquare > 99) {
        self.currentSquare = 100;
        return Finish;
    }
    
    if (gameLogic[[NSNumber numberWithUnsignedInteger:_eventSquare]]  != nil) {
        self.currentSquare = [gameLogic[[NSNumber numberWithUnsignedInteger:_eventSquare]] unsignedIntValue];
        if(_currentSquare > _eventSquare) {
            gameEvent = Ladder;
        }
        else if (_currentSquare < _eventSquare) {
            gameEvent = Snakes;
        }
     }
    else
        self.currentSquare = self.eventSquare;
    
    return gameEvent;
}

@end
