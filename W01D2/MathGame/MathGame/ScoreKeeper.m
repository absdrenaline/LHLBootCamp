//
//  ScoreKeeper.m
//  MathGame
//
//  Created by Arun on 2019-05-28.
//  Copyright © 2019 LogicIO. All rights reserved.
//

#import "ScoreKeeper.h"

@implementation ScoreKeeper {
    int wins;
    int losses;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        wins = 0;
        losses = 0;
    }
    return self;
}

- (void)registerWin {
    wins++;
}

- (void)registerLoss {
    losses++;
}

- (NSString *)description
{
    int winningPercent = (wins * 100)/(wins + losses);
    return [NSString stringWithFormat:@"score: %d right, %d wrong --- %d%%", wins, losses, winningPercent];
}

@end
