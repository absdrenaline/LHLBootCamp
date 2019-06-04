//
//  GameModel.h
//  MathGame
//
//  Created by Arun on 2019-06-03.
//  Copyright © 2019 LogicIO. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface GameModel : NSObject

@property (nonatomic, copy) NSString *currentPlayer;
@property (nonatomic,readonly) BOOL isGameOver;

-(NSString *) nextTurn;
- (BOOL)acceptAnswer:(NSString *)answer;
-(NSUInteger)activePlayerScore;
-(NSUInteger)playerScore:(NSUInteger)playerIndex;
-(NSString *)playerName:(NSUInteger)playerIndex;

@end

NS_ASSUME_NONNULL_END
