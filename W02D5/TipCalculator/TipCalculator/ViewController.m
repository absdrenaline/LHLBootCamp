//
//  ViewController.m
//  TipCalculator
//
//  Created by Arun on 2019-06-07.
//  Copyright © 2019 LogicIO. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *billAmountTextField;
@property (weak, nonatomic) IBOutlet UILabel *tipAmountLabel;
@property (weak, nonatomic) IBOutlet UISlider *tipSlider;
@property (weak, nonatomic) IBOutlet UITextField *tipPercentageTextField;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.billAmountTextField setDelegate:self];
    [self.tipPercentageTextField setDelegate:self];
    self.billAmountTextField.keyboardType = UIKeyboardTypeDecimalPad;
    self.tipPercentageTextField.keyboardType = UIKeyboardTypeDecimalPad;
    self.tipSlider.minimumValue = 0;
     self.tipSlider.maximumValue = 100;
    self.tipSlider.value = 15;
    
}
- (IBAction)calculateTip:(id)sender {
    float billAmount = [self.billAmountTextField.text floatValue];
    float tipPercentage = self.tipSlider.value/100;
    
    float tipAmount = billAmount * tipPercentage;
    NSString* tipStringAmount = [NSString stringWithFormat:@"$%.2f",tipAmount];
    self.tipAmountLabel.text = tipStringAmount;
}


- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    NSCharacterSet *numbersOnlySet = [NSCharacterSet characterSetWithCharactersInString:@"0123456789."];
    
    NSCharacterSet *inTextViewSet = [NSCharacterSet characterSetWithCharactersInString:string];
    
    BOOL stringIsValid = [numbersOnlySet isSupersetOfSet:inTextViewSet];
    
    return stringIsValid;
}
- (IBAction)tipChanged:(UISlider *)sender {
    self.tipPercentageTextField.text = [NSString stringWithFormat:@"%.1f", self.tipSlider.value];
}
- (IBAction)tipPercentageTextFieldChanged:(UITextField *)sender {
    self.tipSlider.value = [self.tipPercentageTextField.text floatValue];
}

@end
