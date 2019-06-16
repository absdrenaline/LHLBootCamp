////  SummaryViewController.m
// Created: 2019-06-11
//


#import "SummaryViewController.h"
#import "Task.h"
#import "TaskPresenter.h"
#import "SummaryTaskCell.h"
#import "DetailViewController.h"

@interface SummaryViewController ()

@end

@implementation SummaryViewController {
    NSMutableArray<Task *> *_cacheTasks;
    Task *placeholderTask;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    _cacheTasks = [[TaskPresenter defaultTaskPresenter].tasks mutableCopy];
    self.tableView.tableFooterView = [UIView new];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_cacheTasks count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    SummaryTaskCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TaskSummary" forIndexPath:indexPath];
    
    Task* task = _cacheTasks[indexPath.row];
    cell.priorityLabel.text = [NSString stringWithFormat:@"%2li",(long)task.priority];
    cell.titleLabel.text = task.title;
    cell.detailLabel.text = task.detail;
    [self updateCell:cell WithTask:task];
    
    return cell;
}

- (IBAction)checkedTask:(UIButton *)sender {
    CGPoint checkBoxLocation = [sender convertPoint:CGPointZero toView:self.tableView];
    NSIndexPath *indexPath = [self.tableView indexPathForRowAtPoint:checkBoxLocation];
    
    SummaryTaskCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
    Task* task = _cacheTasks[indexPath.row];
    
    task.isComplete = !task.isComplete;
     [self updateCell:cell WithTask:task];
}

-(void)markTaskComplete:(NSIndexPath *)indexPath {


}

-(void)markTaskIncomplete:(NSIndexPath *)indexPath {
    SummaryTaskCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
    
    Task* task = _cacheTasks[indexPath.row];
    task.isComplete = NO;
    
    [self updateCell:cell WithTask:task];
    
}

-(void)updateCell:(SummaryTaskCell *)cell WithTask:(Task *)task {
    
    if(task.isComplete) {
        [cell.taskCheckBox setImage:[UIImage imageNamed:@"checked"] forState:UIControlStateNormal];
        cell.titleLabel.attributedText =
        [[NSAttributedString alloc] initWithString:cell.titleLabel.text attributes:@{NSStrikethroughStyleAttributeName:@(NSUnderlineStyleSingle)}];

    }
    else {
         [cell.taskCheckBox setImage:[UIImage imageNamed:@"unchecked"] forState:UIControlStateNormal];
        cell.titleLabel.attributedText =
        [[NSAttributedString alloc] initWithString:cell.titleLabel.text attributes:@{}];
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([segue.identifier isEqualToString:@"AddTaskSegue"]) {
        DetailViewController* detailViewController = segue.destinationViewController;
        //NSIndexPath * indexPath = [self.tableView indexPathForSelectedRow];
        placeholderTask = [Task new];
        detailViewController.task = placeholderTask;
    } else if ([segue.identifier isEqualToString:@"showTaskSegue"]) {
        DetailViewController* detailViewController = segue.destinationViewController;
        NSIndexPath * indexPath = [self.tableView indexPathForSelectedRow];
        detailViewController.task = _cacheTasks[indexPath.row];
    }
        
}

- (IBAction) unwindToRootViewController: (UIStoryboardSegue *) segue {
    NSLog(@"Selected a category in %@",segue.sourceViewController);
    
    if( [segue.sourceViewController isKindOfClass:[DetailViewController class]]) {
        Task *task = ((DetailViewController*) segue.sourceViewController).task;
        if (task == placeholderTask) {
            [_cacheTasks addObject:task];
            placeholderTask = nil;
            NSIndexPath *indexPath = [NSIndexPath indexPathForRow:([_cacheTasks count] - 1) inSection:0];
            [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
        }
    }
    [self.tableView reloadData];
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if(editingStyle == UITableViewCellEditingStyleDelete) {
        [_cacheTasks removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        
    }
}

/*
- (UISwipeActionsConfiguration *)tableView:(UITableView *)tableView trailingSwipeActionsConfigurationForRowAtIndexPath:(NSIndexPath *)indexPath {
    UIContextualAction *delete = [UIContextualAction contextualActionWithStyle:UIContextualActionStyleDestructive
                                                                         title:@"DELETE"
                                                                       handler:^(UIContextualAction * _Nonnull action, __kindof UIView * _Nonnull sourceView, void (^ _Nonnull completionHandler)(BOOL)) {
                                                                               NSLog(@"index path of delete: %@", indexPath);
                                                                           [self->_cacheTasks removeObjectAtIndex:indexPath.row];
                                                                               completionHandler(YES);
                                                                           [self.tableView reloadData];
                                                                           
                                                                           
                                                                       }];
    delete.backgroundColor = [UIColor  redColor]; //arbitrary color
    delete.image = [UIImage imageNamed:@"trash"];
    
    UISwipeActionsConfiguration *swipeActionConfig = [UISwipeActionsConfiguration configurationWithActions:@[delete]];
    swipeActionConfig.performsFirstActionWithFullSwipe = NO;
    
    return swipeActionConfig;
    
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
