//
//  InputHandler.m
//  MathGame
//
//  Created by Arun on 2019-05-28.
//  Copyright © 2019 LogicIO. All rights reserved.
//

#import "InputHandler.h"


@implementation InputHandler


- (instancetype)initWithBufferSize:(uint) bufferSize
{
    self = [super init];
    if (self) {
            _isQuit = NO;
        _bufferSize = bufferSize;
    }
    
    return self;
}

- (void) captureInputFromConsole {
    //Capture input from the user;
    char input[_bufferSize];
    fgets(input,_bufferSize,stdin);
    
    NSString* inputString = [NSString stringWithCString:input encoding:NSUTF8StringEncoding];
    if ([inputString isEqualToString:@"quit"]) {
        _isQuit = YES;
    } else {
        _isQuit = NO;
        //Intialize a charset to clean out the user input
        NSCharacterSet *trimCharacterSet = [NSCharacterSet whitespaceAndNewlineCharacterSet];
        _inputString = [inputString stringByTrimmingCharactersInSet:trimCharacterSet];
    }
}
@end
