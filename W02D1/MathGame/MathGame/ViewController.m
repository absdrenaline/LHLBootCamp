//
//  ViewController.m
//  MathGame
//
//  Created by Arun on 2019-06-03.
//  Copyright © 2019 LogicIO. All rights reserved.
//

#import "ViewController.h"
#import "GameModel.h"

@interface ViewController ()

@end

@implementation ViewController {
    GameModel* model;
    __weak IBOutlet UILabel *score1;
    __weak IBOutlet UILabel *score2;
    __weak IBOutlet UILabel *puzzleString;
    __weak IBOutlet UILabel *statusString;
    __weak IBOutlet UILabel *inputString;
}

- (void)nextTurn {
    NSString* question = [model nextTurn];
    puzzleString.text = [NSString stringWithFormat:@"%@: %@",model.currentPlayer,question];
    score1.text = [NSString stringWithFormat:@"%@: %lu",[model playerName:0],(unsigned long)[model playerScore:0]];
    score2.text = [NSString stringWithFormat:@"%@: %lu",[model playerName:1],(unsigned long)[model playerScore:1]];
    inputString.text = @"";
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    model = [GameModel new];
    [self nextTurn];
    statusString.text = @"";
}

- (IBAction)numberTouched:(id)sender {
    
    UIButton *button = (UIButton *)sender;
 
    switch (button.tag) {
        case 0:
        case 1:
        case 2:
        case 3:
        case 4:
        case 5:
        case 6:
        case 7:
        case 8:
        case 9:
           inputString.text = [inputString.text stringByAppendingFormat:@"%ld",button.tag];
            break;
        case 11:
            if ([inputString.text hasPrefix:@"-"]) {
                inputString.text = [inputString.text substringFromIndex:1];
            } else {
                inputString.text = [NSString stringWithFormat:@"-%@",inputString.text];
            }
            break;
        case 12:
            if (![inputString.text containsString:@"."]) {
                inputString.text = [inputString.text stringByAppendingString:@"."];
            }
            break;
        default:
            break;
            
    }
}

- (IBAction)answerTouched:(id)sender {
    
    if ([model isGameOver])
        return;
    
    if ([model acceptAnswer:inputString.text]) {
        statusString.text = @"Correct!";
        statusString.textColor = UIColor.greenColor;
        statusString.alpha = 1.0;
    } else {
        statusString.text = @"Incorrect!";
        statusString.textColor = UIColor.redColor;
        statusString.alpha = 1.0;
        
        if ([model isGameOver]) {
            [self doGameOver];
            return;
        }
    }
    [UIView animateWithDuration:1
                           animations:^{self->statusString.alpha = 0.0;}];
     [self nextTurn];
//    if(model.isGameOver) {
//
//    } else {
//
//    }
//
    
}

-(void) doGameOver {
    puzzleString.text = [NSString stringWithFormat:@"%@ LOST",[model currentPlayer]];
    statusString.text = @"Game Over!";
    statusString.textColor = UIColor.redColor;
    statusString.alpha = 1.0;
    
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Game Over"
                                                                   message:@"Would you like to play another game?"
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* yesAction = [UIAlertAction actionWithTitle:@"Yes" style:UIAlertActionStyleDefault
                                                      handler:^(UIAlertAction * action) {
                                                          [self reset];
                                                      }];
    UIAlertAction* noAction = [UIAlertAction actionWithTitle:@"No" style:UIAlertActionStyleDefault
                                                     handler:^(UIAlertAction * action) {
                                                         
                                                     }];
    
    [alert addAction:yesAction];
    [alert addAction:noAction];
    
    [self presentViewController:alert animated:YES completion:nil];
    
}

-(void)reset {
    model = [GameModel new];
    [self nextTurn];
    statusString.text = @"";
}

@end
