//
//  main.m
//  Boxes
//
//  Created by Arun on 2019-05-28.
//  Copyright © 2019 LogicIO. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Box.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        Box* box = [[Box alloc] initWithDimensions:1.0 Width:2.0 Length:3.0];
        Box* smallerBox = [[Box alloc] initWithDimensions:0.5 Width:1.0 Length:1.5];
        
        NSLog(@"The volume of the bigger box is %f",[box volume]);
        NSLog(@"The volume of the smaller box is %f",[smallerBox volume]);
        
        NSLog(@"Times smaller box fits in bigger box: %i", [smallerBox timesFitsInAnotherBox:box]);
        NSLog(@"Times bigger box fits in smaller box: %i", [box timesFitsInAnotherBox:smallerBox]);
    }
    return 0;
}
