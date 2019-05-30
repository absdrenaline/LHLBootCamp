//
//  Doctor.h
//  MedicalClinic
//
//  Created by Arun on 2019-05-30.
//  Copyright © 2019 LogicIO. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Patient;
@class Prescription;

NS_ASSUME_NONNULL_BEGIN

@interface Doctor : NSObject

@property NSString* name;
@property NSString* specialization;

- (instancetype)initWith:(NSString*) name
      withSpecialization:(NSString*) specialization;

-(BOOL) visit:(Patient *) patient;
-(Prescription *) requestMedication:(Patient*) patient;

@end

NS_ASSUME_NONNULL_END
