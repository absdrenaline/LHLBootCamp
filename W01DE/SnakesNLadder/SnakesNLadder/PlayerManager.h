//
//  PlayerManager.h
//  SnakesNLadder
//
//  Created by Arun on 2019-06-02.
//  Copyright © 2019 LogicIO. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface PlayerManager : NSObject

@property (nonatomic, readonly) NSUInteger playerCount;

-(void) createPlayers:(NSUInteger) count;
-(void) roll;
-(NSString*) score;
-(void) reset;


@end

NS_ASSUME_NONNULL_END
