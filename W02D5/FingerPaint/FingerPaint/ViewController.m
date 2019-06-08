//
//  ViewController.m
//  FingerPaint
//
//  Created by Arun on 2019-06-07.
//  Copyright © 2019 LogicIO. All rights reserved.
//

#import "ViewController.h"
#import "CanvasView.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet CanvasView *canvasView;
@property (weak, nonatomic) IBOutlet UIStackView *colorStack;

@end

@implementation ViewController {
    NSArray<UIColor *> *colorsInPalette;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    _canvasView.drawColor = [UIColor redColor];
    colorsInPalette = @[[UIColor redColor],
                        [UIColor blueColor],
                        [UIColor greenColor],
                        [UIColor brownColor]
                        ];
    
    for (UIColor *color in colorsInPalette) {
        UIButton *colorButton = [UIButton new];
        colorButton.frame = CGRectMake(0,0,50,50);
        colorButton.layer.masksToBounds = YES;
        //colorButton.layer.cornerRadius = 25;
        colorButton.backgroundColor = color;
        colorButton.tag = [colorsInPalette indexOfObject:color];
        [colorButton sizeToFit];
        [colorButton addTarget:self action:@selector(changeColor:) forControlEvents:UIControlEventTouchUpInside];
        [_colorStack addArrangedSubview:colorButton];
    }
    
    // Do any additional setup after loading the view.
}

-(void)changeColor:(UIButton *)sender {
    NSLog(@"Color changed to %@",colorsInPalette[sender.tag]);
    self.canvasView.drawColor = colorsInPalette[sender.tag];
}

@end
