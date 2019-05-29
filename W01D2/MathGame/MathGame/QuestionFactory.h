//
//  QuestionFactory.h
//  MathGame
//
//  Created by Arun on 2019-05-29.
//  Copyright © 2019 LogicIO. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Question.h"

NS_ASSUME_NONNULL_BEGIN

@interface QuestionFactory : NSObject

- (Question *) generateRandomQuestion;

@end

NS_ASSUME_NONNULL_END
