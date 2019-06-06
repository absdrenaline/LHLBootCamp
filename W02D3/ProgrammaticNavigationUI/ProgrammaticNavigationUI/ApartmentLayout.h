//
//  ApartmentLayout.h
//  ProgrammaticNavigationUI
//
//  Created by Arun on 2019-06-05.
//  Copyright © 2019 LogicIO. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Room;
NS_ASSUME_NONNULL_BEGIN

@interface ApartmentLayout : NSObject

@property (nonatomic, readonly) Room *mainDoor;

+(Room *)mainDoor;

@end

NS_ASSUME_NONNULL_END
