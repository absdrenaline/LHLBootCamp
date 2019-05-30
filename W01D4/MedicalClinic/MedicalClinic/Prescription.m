//
//  Prescription.m
//  MedicalClinic
//
//  Created by Arun on 2019-05-30.
//  Copyright © 2019 LogicIO. All rights reserved.
//

#import "Prescription.h"

@implementation Prescription

- (instancetype)initWith:(NSArray *) medicines
{
    self = [super init];
    if (self) {
        _medicines = [NSSet setWithArray:medicines];
    }
    return self;
}
@end
