//
//  main.m
//  ContactManagement
//
//  Created by Arun on 2019-05-28.
//  Copyright © 2019 LogicIO. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Contact.h"
#import "ContactList.h"
#import "InputCollector.h"



void doCreateNewContact(ContactList* contactList,InputCollector *inputHandler)
{
    NSLog(@"Creating new contact\n");
    NSString* inputEmail = [inputHandler inputForPrompt:@"Enter email: "];
    if ([contactList findByEmail:inputEmail] >= 0) {
        NSLog(@"Duplicate email. Contact already exists!");
        return;
    }
    NSString* inputName = [inputHandler inputForPrompt:@"Enter name: "];
    
    Contact*  contact = [[Contact alloc] initWithNameAndEmail:inputName Email:inputEmail];
    
    NSLog(@"Enter phone numbers, e.g Home:123-423-2222.\nEmpty Line to stop.");
    int phoneCounter = 1;
    do {
        NSString* phoneNumberString = [inputHandler inputForPrompt:[NSString stringWithFormat:@"Phone %d: ",phoneCounter]];
        if ([phoneNumberString isEqualToString:@""]) {
            break;
        }
        else {
            [contact addPhoneNumber:phoneNumberString];
            phoneCounter++;
        }
    } while (YES);
   
    [contactList addContact:contact];
}


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        NSDictionary* commandDictionary = @{
                                            @"list":@"List all contacts",
                                            @"new":@"Create a new contact list",
                                            @"quit":@"Exit Application",
                                            @"show":@"Show the details of contact",
                                            @"find":@"find contacts with substring",
                                            @"history":@"show the last 3 commands"
                                            };
        
        NSMutableString *menuString = [NSMutableString stringWithString:@"What would you like do next?\n"];
        for (NSString *cmd in commandDictionary) {
           [menuString appendFormat:@"%@ - %@\n",cmd, [commandDictionary objectForKey:cmd]];
        }
        [menuString appendString:@"> "];
        
        ContactList* contactList = [[ContactList alloc] init];
        
        InputCollector *inputHandler = [[InputCollector alloc] initWithBufferSize:10];
        BOOL bContinue = YES;
        while (bContinue) {
            
            NSString* inputString = [inputHandler inputForPrompt:menuString];
            NSString* inputCmd = [inputString componentsSeparatedByString:@" "][0];
            inputCmd = [inputCmd lowercaseString];
            
            if ([commandDictionary objectForKey:inputCmd] == nil) {
                NSLog(@"Invalid input. Try Again!\n");
                continue;
            }
            
            [inputHandler logCommand:inputString];
            
            if([inputCmd isEqualToString:@"quit"]) {
                bContinue = NO;
                continue;
            }
            
            if([inputCmd isEqualToString:@"list"]) {
                [contactList printAll];
            }
            
            if([inputCmd isEqualToString:@"new"]) {
                doCreateNewContact(contactList,inputHandler);
            }
            
            if([inputCmd hasPrefix:@"show"]) {
                NSArray* subStrings = [inputString componentsSeparatedByString:@" "];
                NSString* indexString = subStrings[1];
                [contactList showContact:[indexString intValue]];
            }
            
            if([inputCmd hasPrefix:@"find"]) {
                NSArray* subStrings = [inputString componentsSeparatedByString:@" "];
                NSString* searchString = subStrings[1];
                [contactList findAndPrint:searchString];
            }
            
            if([inputCmd isEqualToString:@"history"]) {
                [inputHandler printHistory];
            }
            
        }
    }
    return 0;
}
