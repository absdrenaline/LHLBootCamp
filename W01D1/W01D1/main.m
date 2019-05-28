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
            operationNumber = captureIntFromConsole("Enter the number between 1 to 9 to perform an operation on a string: ");
            if (operationNumber < 1 || operationNumber > 9) {
                printf("I only understand operations from 1 - 9. Try again!\n");
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
            
            // Read the string only till the newline (exlude the newline)
            printf("The memory location is %p\n",trimmedChars);
            
            // convert char array to an NSString object
            NSMutableString *inputString = [NSMutableString stringWithUTF8String:trimmedChars];
            
            // print NSString object
            NSLog(@"Input was: %@", inputString);
            NSLog(@"Located at %p",inputString);
            
            NSMutableString* outputString;
            
            switch (operationNumber) {
                case 1:
                    //Convert to upper case.
                    outputString = [NSMutableString stringWithString:[inputString uppercaseString]];
                    break;
                    
                case 2:
                    outputString = [NSMutableString stringWithString:[inputString lowercaseString]];
                    break;
                
                case 3:
                {
                    NSInteger outputNumber = [inputString integerValue];
                    if (outputNumber == 0 && [inputString isNotEqualTo:@"0"]) {
                        outputString = [NSMutableString stringWithString:@"Conversion to number failed!"];
                        break;
                    }
                    outputString = [NSMutableString stringWithString:@"Conversion succeeded!"];
                    break;
                }
                case 4:
                    outputString = [NSMutableString stringWithString:[inputString stringByAppendingString:@", eh?"]];
                    break;
                
                case 5:
                    if([inputString hasSuffix:@"?"])
                        outputString = [NSMutableString stringWithString:@"I don't know"];
                    else if([inputString hasSuffix:@"!"])
                        outputString = [NSMutableString stringWithString:@"Whoa, calm down!"];
                    else
                        outputString = inputString;
                    break;
                case 6:
                    outputString = [NSMutableString stringWithString:
                                    [inputString stringByReplacingOccurrencesOfString:@" " withString:@"-"]];
                    break;
                case 7:
                {
                    //Count the alphanumeric letters in the string
                    NSCharacterSet* letterCharacterSet = [NSCharacterSet letterCharacterSet];
                    long lenInputString = [[inputString componentsSeparatedByCharactersInSet:letterCharacterSet] count] - 1;
                    outputString = [NSMutableString stringWithFormat:@"The count of letters in input string is %lu",lenInputString];
                    break;
                }
                case 8:
                {
                    //Remove all puntuations
                    NSCharacterSet* punctuationCharacterSet = [NSCharacterSet punctuationCharacterSet];
                    NSString* stringWithoutPuntuation = [[inputString componentsSeparatedByCharactersInSet:punctuationCharacterSet] componentsJoinedByString:@""];
                    outputString = [NSMutableString stringWithString:stringWithoutPuntuation];
                    break;
                }
                case 9:
                {
                    //Replace all letters with emojis
                    //The regex pattern is dervived from Apple's documentation for /w
                    NSRegularExpression *letterMatchExpression = [NSRegularExpression
                                                                  regularExpressionWithPattern:@"[\\p{Ll}\\p{Lu}\\p{Lt}\\p{Lo}]"
                                                                  options:0
                                                                  error:Nil];
                    
                    outputString = [NSMutableString stringWithString:
                                    [letterMatchExpression
                                    stringByReplacingMatchesInString:inputString
                                    options:0
                                    range:NSMakeRange(0, [inputString length])
                                     withTemplate:@"😎"]];
                    break;
                    
                }
                default:
                    outputString = [NSMutableString stringWithString:@"I didn't implement that operation yet!"];
            }
            
            // print NSString object
            NSLog(@"Output of operation is: %@", outputString);
            NSLog(@"Located at %p",outputString);
            
            
            //This is a long long string more than 255 chars. Let's see if this is broken up. This is a long long string more than 255 chars. Let's see if this is broken up. This is a long long string more than 255 chars. Let's see if this is broken up. This is a long long string more than 255 chars. Let's see if this is broken up. This is a long long string more than 255 chars. Let's see if this is broken up. This is a long long string more than 255 chars. Let's see if this is broken up.
        }
    }
    return 0;
}
