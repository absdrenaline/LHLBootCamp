//
//  Room.m
//  ProgrammaticNavigationUI
//
//  Created by Arun on 2019-06-05.
//  Copyright © 2019 LogicIO. All rights reserved.
//

#import "Room.h"

@implementation Room

-(instancetype)initWithName: (NSString *)name andImageName:(NSString *)imageName
{
    self = [super init];
    if(self) {
        _name = name;
        _imageName= imageName;
    }
    return self;
}

@end
