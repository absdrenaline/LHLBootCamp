//
//  ContactList.h
//  ContactManagement
//
//  Created by Arun on 2019-05-28.
//  Copyright © 2019 LogicIO. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Contact;

NS_ASSUME_NONNULL_BEGIN

@interface ContactList : NSObject

@property NSMutableArray* contacts;

-(void)addContact:(Contact *)newContact;
-(void)printAll;
-(void)showContact:(int) index;
-(void)findAndPrint:(NSString*) subString;
-(int)findByEmail:(NSString*) email;

@end

NS_ASSUME_NONNULL_END
