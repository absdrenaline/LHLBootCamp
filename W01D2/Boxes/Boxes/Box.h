//
//  Box.h
//  Boxes
//
//  Created by Arun on 2019-05-28.
//  Copyright © 2019 LogicIO. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Box : NSObject

@property float height;
@property float width;
@property float length;

- (instancetype)initWithDimensions:(float) height
                             Width:(float) width
                            Length:(float) length;

- (float) volume;

// @return: returns the (integer) number of times the box fits in another box.
//  Negative if another box is smaller compared to this box

- (int) timesFitsInAnotherBox:(Box *) anotherBox;

@end

NS_ASSUME_NONNULL_END
