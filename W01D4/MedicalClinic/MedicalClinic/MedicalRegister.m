//
//  MedicalRegister.m
//  MedicalClinic
//
//  Created by Arun on 2019-05-30.
//  Copyright © 2019 LogicIO. All rights reserved.
//

#import "MedicalRegister.h"

@implementation MedicalRegister

- (instancetype)init
{
    self = [super init];
    if (self) {
        _prescriptionRegister = [[NSMutableDictionary alloc] init];
    }
    return self;
}

@end
