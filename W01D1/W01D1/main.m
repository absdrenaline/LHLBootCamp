//
//  main.m
//  W01D1
//
//  Created by Arun on 2019-05-27.
//  Copyright © 2019 LogicIO. All rights reserved.
//

#import <Foundation/Foundation.h>


long captureIntFromConsole(const char* prompt) {
    long number;
    char nextChar;
    while(YES) {
        printf("%s",prompt);
        if (scanf(" %ld%c", &number,&nextChar) == 2 && nextChar == '\n') {
            return number;
        }
        else {
            printf("Ummm...I only understand integer numbers\n");
            scanf("%*[^\n]c"); //ignore all characters until the newline char;
            scanf("%*c"); //ignore the newline char;
        }
    }
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        while (YES) {
            
            long operationNumber;
            operationNumber = captureIntFromConsole("Enter the number between 1 to 6 to perform an operation on a string: ");
            if (operationNumber < 1 || operationNumber > 6) {
                printf("I only understand operations from 1 - 6. Try again!\n");
                continue;
            }
           
            // 255 unit long array of characters
            char inputChars[255];
            printf("Input the string: ");
            
            // limit input to max 255 characters
            fgets(inputChars, 255, stdin);
            char *trimmedChars = strtok(inputChars,"\n");
            
            // print as a c string
            printf("Your string is %s\n", trimmedChars);
            printf("The memory location is %p\n",trimmedChars);
            
            // convert char array to an NSString object
            NSString *inputString = [NSString stringWithUTF8String:trimmedChars];
            
            // print NSString object
            NSLog(@"Input was: %@", inputString);
            NSLog(@"Located at %p",inputString);
            
            
            //This is a long long string more than 255 chars. Let's see if this is broken up. This is a long long string more than 255 chars. Let's see if this is broken up. This is a long long string more than 255 chars. Let's see if this is broken up. This is a long long string more than 255 chars. Let's see if this is broken up. This is a long long string more than 255 chars. Let's see if this is broken up. This is a long long string more than 255 chars. Let's see if this is broken up.
        }
    }
    return 0;
}
