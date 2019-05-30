//
//  Doctor.m
//  MedicalClinic
//
//  Created by Arun on 2019-05-30.
//  Copyright © 2019 LogicIO. All rights reserved.
//

#import "Doctor.h"
#import "Patient.h"
#import "Prescription.h"
#import "MedicalRegister.h"

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

- (BOOL)visit:(Patient *) patient {
    if ( patient.hasHealthCard ) {
        return YES;
    }
    return NO;
}

- (Prescription *)requestMedication:(Patient *)patient {
    if([[patient symptoms] count]) {
       Prescription* prescription = [[Prescription alloc]
                                initWith:@[@"rest",@"tynelol"]];
        return prescription;
    }
       return nil;
}
@end
