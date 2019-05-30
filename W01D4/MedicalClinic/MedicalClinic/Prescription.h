//
//  Prescription.h
//  MedicalClinic
//
//  Created by Arun on 2019-05-30.
//  Copyright © 2019 LogicIO. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Prescription : NSObject

@property NSSet* medicines;

- (instancetype)initWith:(NSArray *) medicines;

@end

NS_ASSUME_NONNULL_END
