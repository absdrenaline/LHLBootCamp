//
//  Doctor.m
//  MedicalClinic
//
//  Created by Arun on 2019-05-30.
//  Copyright © 2019 LogicIO. All rights reserved.
//

#import "Doctor.h"

@implementation Doctor

- (instancetype)initWith:(NSString*) name
      withSpecialization:(NSString*) specialization
{
    self = [super init];
    if (self) {
        _name = name;
        _specialization = specialization;
    }
    return self;
}
@end
