////  DetailViewController.m
// Created: 2019-06-12
//


#import "DetailViewController.h"
#import "Task.h"

@interface DetailViewController ()
@property (weak, nonatomic) IBOutlet UINavigationItem *backNavigation;

@end

@implementation DetailViewController {
    Task* localTask;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.descriptionTextView.layer.borderColor = [[UIColor lightGrayColor] CGColor];
    self.descriptionTextView.layer.borderWidth = 0.5f;
    self.descriptionTextView.layer.cornerRadius = 8;
    self.tableView.tableFooterView = [UIView new];
    
    self.navigationController.navigationBar
    .tintColor  = [UIColor blackColor];
    self.navigationController.navigationBarHidden = NO;
    
    
    if (self.task) {
        localTask = [Task new];
        localTask.priority = self.task.priority;
        localTask.isComplete = self.task.isComplete;
        localTask.title = self.task.title;
        localTask.detail = self.task.detail;
    }
    self.titleTextField.text = localTask.title;
    self.priorityStepper.value = localTask.priority;
    self.descriptionTextView.text = localTask.detail;
    [self.taskCompletionSwitch setOn:localTask.isComplete];
    
    [self updatePriorityLabel];

    
}
- (IBAction)doTaskMarkComplete:(UISwitch *)sender {
    localTask.isComplete = sender.isOn;
}

- (IBAction)doPriorityChange:(UIStepper *)sender {
    localTask.priority = sender.value;
    [self updatePriorityLabel];
}

- (void) updatePriorityLabel {
    self.priorityValueLabel.text = [NSString stringWithFormat:@"%2.0lf",self.priorityStepper.value];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([segue.identifier isEqualToString:(@"taskEditComplete")]) {
        localTask.title = self.titleTextField.text;
        localTask.priority = self.priorityStepper.value;
        localTask.detail = self.descriptionTextView.text;
        localTask.isComplete = self.taskCompletionSwitch.isOn;
        
        self.task.priority = localTask.priority ;
        self.task.isComplete = localTask.isComplete ;
        self.task.title = localTask.title ;
        self.task.detail = localTask.detail ;
    }
}
@end
