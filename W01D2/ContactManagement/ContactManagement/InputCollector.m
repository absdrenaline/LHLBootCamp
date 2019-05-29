//
//  InputCollector.m
//  ContactManagement
//
//  Created by Arun on 2019-05-28.
//  Copyright © 2019 LogicIO. All rights reserved.
//

#import "InputCollector.h"

@implementation InputCollector

- (instancetype)initWithBufferSize:(uint) bufferSize
{
    self = [super init];
    if (self) {
        _bufferSize = bufferSize;
        _history = [[NSMutableArray alloc] init];
    }
    
    return self;
}

-(NSString *)inputForPrompt:(NSString *)promptString {
    
    NSLog(@"%@",promptString);
    
    //Capture input from the user;
    char input[_bufferSize];
    fgets(input,_bufferSize,stdin);
    
    NSString* inputString = [NSString stringWithCString:input encoding:NSUTF8StringEncoding];
    
    //Intialize a charset to clean out the user input
    NSCharacterSet *trimCharacterSet = [NSCharacterSet whitespaceAndNewlineCharacterSet];
    return [inputString stringByTrimmingCharactersInSet:trimCharacterSet];
}

- (void) logCommand:(NSString *)cmd {
    [self.history addObject:cmd];
}

- (void) printHistory {
    NSLog(@"Command History (last 3 only) :\n");
    unsigned long startIndex = 0;
    unsigned long length = 3;
    if ([self.history count] > 3) {
        startIndex = [self.history count] - 3;
    } else {
        length = [self.history count] - 1;
    }
    NSArray *lastHistory = [self.history subarrayWithRange:NSMakeRange(startIndex, length)];
    for (NSString *cmd in lastHistory) {
        NSLog(@"%@\n",cmd);
    }
}
@end
