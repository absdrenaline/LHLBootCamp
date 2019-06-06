//
//  Room.h
//  ProgrammaticNavigationUI
//
//  Created by Arun on 2019-06-05.
//  Copyright © 2019 LogicIO. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Room : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString* imageName;
@property (nonatomic, copy) NSArray<Room *> *hasDoorsTo;

-(instancetype)initWithName: (NSString *)name andImageName:(NSString *)imageName;
@end

NS_ASSUME_NONNULL_END
