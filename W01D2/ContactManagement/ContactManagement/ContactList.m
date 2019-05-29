//
//  ContactList.m
//  ContactManagement
//
//  Created by Arun on 2019-05-28.
//  Copyright © 2019 LogicIO. All rights reserved.
//

#import "ContactList.h"
#import "Contact.h"

@implementation ContactList


- (instancetype)init
{
    self = [super init];
    if (self) {
        _contacts = [[NSMutableArray alloc] initWithCapacity:5];
    }
    return self;
}

-(void) addContact:(Contact *)newContact {
    if (newContact != nil)
        [_contacts addObject:newContact];
}

- (void)printAll {
    for(int i=0; i < [self.contacts count]; i++)
        NSLog(@"%d: %@",i, [[self.contacts objectAtIndex:i] name]);
}

- (void)showContact:(int) index {
    if (index + 1 > [self.contacts count]) {
        return;
    }
    Contact* contact = [self.contacts objectAtIndex:index];
    [contact print];
}

-(void) findAndPrint:(NSString*) subString {
    for(int i=0; i < [self.contacts count]; i++) {
        Contact* contact = [self.contacts objectAtIndex:i];
        if ([contact.name containsString:subString]
            || [contact.email containsString:subString]) {
            [self showContact:i];
        }
    }
}

-(int)findByEmail:(NSString*) email{
    for(int i=0; i < [self.contacts count]; i++) {
        Contact* contact = [self.contacts objectAtIndex:i];
        if ([contact.email isEqualToString:email]) {
            return i;
        }
    }
    return -1;
}

@end
