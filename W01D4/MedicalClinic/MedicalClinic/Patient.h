//
//  Patient.h
//  MedicalClinic
//
//  Created by Arun on 2019-05-30.
//  Copyright © 2019 LogicIO. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Patient : NSObject

@property UInt age;
@property NSString* name;
@property NSString* healthCard;

- (instancetype)initWith:(NSString*) name
                 withAge:(UInt) age
          withHealthCard:(NSString*) healthCard;

- (BOOL) hasHealthCard;


@end

NS_ASSUME_NONNULL_END
