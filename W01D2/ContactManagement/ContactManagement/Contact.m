//
//  Contact.m
//  ContactManagement
//
//  Created by Arun on 2019-05-28.
//  Copyright © 2019 LogicIO. All rights reserved.
//

#import "Contact.h"

@implementation Contact

- (instancetype)initWithNameAndEmail:(NSString*) name
                               Email:(NSString*) email
{
    self = [super init];
    if (self) {
        _name = name;
        _email = email;
        _phoneArray = [[NSMutableArray alloc] init];
    }
    return self;
}


-(void) addPhoneNumber:(NSString*) phoneNumberString {
    [self.phoneArray addObject:phoneNumberString];
}

-(void) print {
    NSLog(@"%@\n",self.name);
    NSLog(@"%@\n",self.email);
    
    for (NSString* phoneString in self.phoneArray) {
        NSLog(@"%@\n",phoneString);
    }
    NSLog(@"\n");
}
@end
