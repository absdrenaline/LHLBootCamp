//
//  Contact.h
//  ContactManagement
//
//  Created by Arun on 2019-05-28.
//  Copyright © 2019 LogicIO. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Contact : NSObject

@property NSString *name;
@property NSString *email;
@property NSMutableArray *phoneArray;


- (instancetype) initWithNameAndEmail:(NSString*) name
                               Email:(NSString*) email;
- (void) addPhoneNumber:(NSString*) phoneNumberString;
- (void) print;

@end

NS_ASSUME_NONNULL_END
