//
//  InputCollector.h
//  ContactManagement
//
//  Created by Arun on 2019-05-28.
//  Copyright © 2019 LogicIO. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface InputCollector : NSObject

@property (nonatomic) uint bufferSize;
@property (nonatomic) NSMutableArray* history;

- (instancetype) initWithBufferSize:(uint) bufferSize;
- (NSString *)inputForPrompt:(NSString *)promptString;
- (void) logCommand:(NSString *)cmd;
- (void) printHistory;

@end

NS_ASSUME_NONNULL_END
