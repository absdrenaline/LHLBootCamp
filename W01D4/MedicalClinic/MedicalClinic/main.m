//
//  main.m
//  MedicalClinic
//
//  Created by Arun on 2019-05-30.
//  Copyright © 2019 LogicIO. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Doctor.h"
#import "Patient.h"
#import "Prescription.h"
#import "MedicalRegister.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        MedicalRegister* obamaCare = [[MedicalRegister alloc] init];
        
        Doctor* doctor = [[Doctor alloc] initWith:@"Dr. Nick" withSpecialization:@"General Practioner"];
        
        Patient* patient = [[Patient alloc] initWith:@"Homer" withAge:35 withHealthCard:@"777"];
        
        NSSet* symptomToday = [NSSet setWithArray:@[@"fever",@"cold"]];
        patient.symptoms = symptomToday;
        
        if ([doctor visit:patient]) {
            Prescription* prescription= [doctor requestMedication:patient];
            
            NSString* healthCard= patient.healthCard;
            if (! obamaCare.prescriptionRegister[healthCard])
            {
                obamaCare.prescriptionRegister[healthCard] =   [[NSMutableDictionary alloc] init];
            }
        obamaCare.prescriptionRegister[healthCard][patient.symptoms] = prescription;
        }
        
        for (id healthCard in obamaCare.prescriptionRegister) {
            NSLog(@"HealthCard: %@",healthCard);
            for (id symptoms in obamaCare.prescriptionRegister[healthCard]) {
                NSLog(@"Symptoms: %@",symptoms);
                NSLog(@"Presciptions: %@",[obamaCare.prescriptionRegister[healthCard][symptoms] medicines]);
            }
        }
        NSSet* symptomMonthLater = [NSSet setWithArray:@[@"fever",@"rashes"]];
        patient.symptoms = symptomMonthLater;
        
    }
    return 0;
}
