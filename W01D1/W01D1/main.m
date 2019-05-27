//
//  main.m
//  W01D1
//
//  Created by Arun on 2019-05-27.
//  Copyright © 2019 LogicIO. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        for(;;) {
            // 255 unit long array of characters
            char inputChars[255];
            
            printf("Input a string: ");
            // limit input to max 255 characters
            fgets(inputChars, 255, stdin);
            
            // print as a c string
            printf("Your string is %s\n", inputChars);
            
            // convert char array to an NSString object
            NSString *inputString = [NSString stringWithUTF8String:inputChars];
            int number = [inputString intValue];
            
            printf("Your number was %d\n",number);
            
            // print NSString object
            NSLog(@"Input was: %@", inputString);
            
            //This is a long long string more than 255 chars. Let's see if this is broken up. This is a long long string more than 255 chars. Let's see if this is broken up. This is a long long string more than 255 chars. Let's see if this is broken up. This is a long long string more than 255 chars. Let's see if this is broken up. This is a long long string more than 255 chars. Let's see if this is broken up. This is a long long string more than 255 chars. Let's see if this is broken up.
        }
    }
    return 0;
}
