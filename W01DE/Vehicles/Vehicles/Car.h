//
//  Car.h
//  Vehicles
//
//  Created by Arun on 2019-06-01.
//  Copyright © 2019 Designated Nerd Software. All rights reserved.
//

#import "Vehicle.h"

NS_ASSUME_NONNULL_BEGIN

@interface Car : Vehicle

@property (nonatomic, assign) BOOL isConvertible;
@property (nonatomic, assign) BOOL isHatchback;
@property (nonatomic, assign) BOOL hasSunroof;
@property (nonatomic, assign) NSInteger numberOfDoors;

@end

NS_ASSUME_NONNULL_END
