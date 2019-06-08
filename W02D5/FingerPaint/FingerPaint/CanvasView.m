//
//  CanvasView.m
//  FingerPaint
//
//  Created by Arun on 2019-06-07.
//  Copyright © 2019 LogicIO. All rights reserved.
//

#import "CanvasView.h"
#import "PathInfo.h"

@interface CanvasView()

@property (nonatomic) NSMutableArray <PathInfo *> *paths;

@end

@implementation CanvasView 

/*
 Only override drawRect: if you perform custom drawing.
 An empty implementation adversely affects performance during animation.
 */
- (void)drawRect:(CGRect)rect {
    for (PathInfo *pathInfo in self.paths) {
        [pathInfo.color setStroke];
        if (CGRectIntersectsRect(rect,pathInfo.path.bounds)) {
            [pathInfo.path stroke];
        }
    }
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"****Touches Moved ****");
    UITouch *touch = [[touches allObjects] objectAtIndex:0];
    CGPoint curPoint = [touch locationInView:self];
    CGPoint prevPoint = [touch previousLocationInView:self];
    
    PathInfo* pathInfo = [[PathInfo alloc] initWithColor:self.drawColor];
    pathInfo.path.lineWidth = 5.0;
    pathInfo.path.lineCapStyle = kCGLineCapRound;
    
    [pathInfo.path moveToPoint:prevPoint];
    [pathInfo.path addLineToPoint:curPoint];
    
    if(!_paths ) {
        _paths = [NSMutableArray new];
    }
    [_paths addObject:pathInfo];
    [self setNeedsDisplay];

}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
}

@end
