//
//  InputHandler.m
//  MathGame
//
//  Created by Arun on 2019-05-28.
//  Copyright © 2019 LogicIO. All rights reserved.
//

#import "InputHandler.h"

static const UInt kDefaultBufferSize = 255;

@implementation InputHandler


- (instancetype)initWithBufferSize:(uint) bufferSize
{
    self = [super init];
    if (self) {
        _bufferSize = bufferSize;
    }
    
    return self;
}

-(instancetype)init {
    return [self initWithBufferSize:kDefaultBufferSize];
}

- (NSString *) captureInputFromConsole {
    //Capture input from the user;
    char input[_bufferSize];
    fgets(input,_bufferSize,stdin);
    
    NSString* inputString = [NSString stringWithCString:input encoding:NSUTF8StringEncoding];
   
    //Intialize a charset to clean out the user input
    NSCharacterSet *trimCharacterSet = [NSCharacterSet whitespaceAndNewlineCharacterSet];
    return [[inputString stringByTrimmingCharactersInSet:trimCharacterSet] lowercaseString];
}

-(void) waitOn {
    printf("(press enter to continue)");
    [self captureInputFromConsole];
    printf("\n");
}

@end
