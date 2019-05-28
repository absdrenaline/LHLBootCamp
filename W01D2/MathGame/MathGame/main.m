//
//  main.m
//  MathGame
//
//  Created by Arun on 2019-05-28.
//  Copyright © 2019 LogicIO. All rights reserved.
//

#import <Foundation/Foundation.h>

static const int kMaxInputSize = 5;

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        while (YES) {
            
            printf("Enter a value: ");
            
            //Capture a number from the user;
            char input[kMaxInputSize];
            fgets(input,kMaxInputSize,stdin);
            
            NSString* inputString = [NSString stringWithCString:input encoding:NSUTF8StringEncoding];
            
            //Intialize a charset to clean out the user input
            NSCharacterSet *trimCharacterSet = [NSCharacterSet whitespaceAndNewlineCharacterSet];
            NSString *cleanInputString = [inputString stringByTrimmingCharactersInSet:trimCharacterSet];
            
            NSLog(@"You input: %@",cleanInputString);
            
            
        }
    }
    return 0;
}
