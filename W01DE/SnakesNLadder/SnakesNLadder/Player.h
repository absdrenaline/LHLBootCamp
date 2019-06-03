//
//  Player.h
//  SnakesNLadder
//
//  Created by Arun on 2019-06-02.
//  Copyright © 2019 LogicIO. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef enum GameEventType {
    None,
    Snakes,
    Ladder,
    Finish
} GameEvent;


@interface Player : NSObject

@property (nonatomic, readonly) NSUInteger currentSquare;
@property (nonatomic, readonly) NSUInteger eventSquare;
@property (nonatomic, readonly) NSUInteger numberOfRolls;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, readonly) NSString *score;

-(NSUInteger)roll;
-(GameEvent)move:(NSUInteger) length;

@end

NS_ASSUME_NONNULL_END
