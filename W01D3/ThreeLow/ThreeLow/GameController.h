//
//  GameController.h
//  ThreeLow
//
//  Created by Arun on 2019-05-30.
//  Copyright © 2019 LogicIO. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface GameController : NSObject

@property (nonatomic,readonly) UInt lowestScore;
@property (nonatomic, readonly) UInt currentScore;
@property (nonatomic, readonly) UInt availableMoves;



/**
 Initializes the game with the given number of dices;

 @param diceCount number of dices to initialize the game with
 
 */
- (instancetype)initWithDiceCount:(UInt) diceCount;

/**
 toggles the dice at the index beween hold and unhold states

 @param index index of the dice to toggle hold
 */
-(void)holdDice:(int) index;

/**
 resets all dice
 */
-(void)resetDice;

/**
 Tells if the player is permitted to roll according to game rules

 @return returns YES if player is permitted to roll
 */
-(BOOL)shouldRoll;

/**
 rolls all the dices in the game that are unheld
 */
-(void)roll;

/**
 print the state of all dices
 */
-(void) print;
@end

NS_ASSUME_NONNULL_END
