//
//  Player.h
//  MathGame
//
//  Created by Arun on 2019-06-03.
//  Copyright © 2019 LogicIO. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Player : NSObject

@property (nonatomic, copy) NSString* name;
@property (nonatomic, assign) NSUInteger lives;

- (instancetype)initWithName: (NSString *)name;

@end

NS_ASSUME_NONNULL_END
