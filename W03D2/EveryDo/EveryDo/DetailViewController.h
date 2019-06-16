////  DetailViewController.h
// Created: 2019-06-12
//


#import <UIKit/UIKit.h>
@class Task;
NS_ASSUME_NONNULL_BEGIN

@interface DetailViewController : UITableViewController
@property (weak, nonatomic) IBOutlet UITextField *titleTextField;
@property (weak, nonatomic) IBOutlet UITextView *descriptionTextView;
@property (weak, nonatomic) IBOutlet UISwitch *taskCompletionSwitch;
@property (weak, nonatomic) IBOutlet UILabel *priorityValueLabel;
@property (weak, nonatomic) IBOutlet UIStepper *priorityStepper;
@property (weak, nonatomic) Task *task;

@end

NS_ASSUME_NONNULL_END
