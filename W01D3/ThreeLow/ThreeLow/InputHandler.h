//
//  InputHandler.h
//  MathGame
//
//  Created by Arun on 2019-05-28.
//  Copyright © 2019 LogicIO. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface InputHandler : NSObject

@property uint bufferSize;

- (instancetype) initWithBufferSize:(uint) bufferSize;
- (NSString *) captureInputFromConsole;
- (void) waitOn;
@end

NS_ASSUME_NONNULL_END
