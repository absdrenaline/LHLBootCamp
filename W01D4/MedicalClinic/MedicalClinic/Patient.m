//
//  Patient.m
//  MedicalClinic
//
//  Created by Arun on 2019-05-30.
//  Copyright © 2019 LogicIO. All rights reserved.
//

#import "Patient.h"

@implementation Patient


- (instancetype)initWith:(NSString*) name
      withAge:(UInt) age
withHealthCard:(NSString*) healthCard
{
    self = [super init];
    if (self) {
        _name = name;
        _age = age;
        _healthCard = healthCard;
    }
    return self;
}

- (BOOL) hasHealthCard {
    if ([_healthCard isEqualToString:@""]) {
        return NO;
    }
    return YES;
}

@end
