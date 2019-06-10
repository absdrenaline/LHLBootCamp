////  ViewController.m
// Created: 2019-06-09
//


#import "ViewController.h"
#import "UIStackView+Background.h"

@interface ViewController () <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UIStackView *inputStackView;
@property (weak, nonatomic) IBOutlet UIStackView *outputStackView;
@property (weak, nonatomic) IBOutlet UITextField *billAmountTextField;
@property (weak, nonatomic) IBOutlet UIButton *calculateButton;
@property (weak, nonatomic) IBOutlet UISlider *splitSlider;
@property (weak, nonatomic) IBOutlet UILabel *personCountLabel;
@property (weak, nonatomic) IBOutlet UILabel *splitAmountLabel;


@end

@implementation ViewController {
    NSNumberFormatter *currencyFormatter;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.inputStackView.backgroundColor = [UIColor whiteColor];
    self.outputStackView.backgroundColor =[UIColor whiteColor];
    self.billAmountTextField.layer.borderColor = [self.calculateButton.backgroundColor CGColor];
    self.billAmountTextField.layer.borderWidth=1.0f;
    
    self.calculateButton.imageView.layer.cornerRadius = 7.0f;
    self.calculateButton.layer.shadowRadius = 3.0f;
    self.calculateButton.layer.shadowColor = [UIColor blackColor].CGColor;
    self.calculateButton.layer.shadowOffset = CGSizeMake(0.0f, 1.0f);
    self.calculateButton.layer.shadowOpacity = 0.5f;
    self.calculateButton.layer.masksToBounds = NO;
    
    if(!currencyFormatter) {
        currencyFormatter = [NSNumberFormatter new];
        //currencyFormatter.usesSignificantDigits = YES;
        currencyFormatter.minimumFractionDigits = 2;
        currencyFormatter.maximumFractionDigits = 2;
        currencyFormatter.numberStyle = NSNumberFormatterCurrencyStyle;
    }
    
    
}

- (IBAction)changedValueOnSlider:(UISlider *)sender {
    self.personCountLabel.text = [NSString stringWithFormat:@"%1.0f",round(sender.value)];
    
}
- (IBAction)doCalculate:(id)sender {
    NSDecimalNumber *billAmount = [NSDecimalNumber decimalNumberWithString:self.billAmountTextField.text];
    NSDecimalNumber *personCount = [[NSDecimalNumber alloc] initWithFloat:self.splitSlider.value];
    NSDecimalNumber *splitValue = [billAmount decimalNumberByDividingBy:personCount];
    
    self.splitAmountLabel.text = [currencyFormatter stringFromNumber:splitValue];
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    NSCharacterSet *numbersOnlySet = [NSCharacterSet characterSetWithCharactersInString:@"0123456789."];
    
    NSCharacterSet *inTextViewSet = [NSCharacterSet characterSetWithCharactersInString:string];
    
    BOOL stringIsValid = [numbersOnlySet isSupersetOfSet:inTextViewSet];
    
    return stringIsValid;
}

@end
