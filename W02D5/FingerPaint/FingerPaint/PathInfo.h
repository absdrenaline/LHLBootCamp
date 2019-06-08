//
//  PathInfo.h
//  FingerPaint
//
//  Created by Arun on 2019-06-07.
//  Copyright © 2019 LogicIO. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface PathInfo : NSObject

@property (nonatomic, strong) UIBezierPath *path;
@property (nonatomic, strong) UIColor *color;

- (instancetype)initWithColor: (UIColor *) color;

@end

NS_ASSUME_NONNULL_END
