//
//  Dice.h
//  ThreeLow
//
//  Created by Arun on 2019-05-30.
//  Copyright © 2019 LogicIO. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Dice : NSObject

@property (nonatomic, readonly) UInt value;
@property (nonatomic, readonly) NSString* valueSymbol;

-(void) roll;
-(instancetype) initWithMax:(UInt) maxValue
                     andMin:(UInt) minValue;


@end

NS_ASSUME_NONNULL_END
