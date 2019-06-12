////  GamePickerViewController.m
// Created: 2019-06-11
//


#import "GamePickerViewController.h"

@interface GamePickerViewController ()

@end

@implementation GamePickerViewController {
    NSArray<NSString *> *_games;
    NSUInteger _selectedIndex;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _games = @[@"Angry Birds",
               @"Chess",
               @"Russian Roulette",
               @"Spin the Bottle",
               @"Texas Hold'em Poker",
               @"Tic-Tac-Toe"];
    _selectedIndex = [_games indexOfObject:self.game];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_games count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"GameCell" forIndexPath:indexPath];
    cell.textLabel.text = _games[indexPath.row];
    
    if (indexPath.row == _selectedIndex) {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    } else {
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (_selectedIndex != NSNotFound) {
        UITableViewCell *cell = [tableView cellForRowAtIndexPath:
                                 [NSIndexPath indexPathForRow:_selectedIndex inSection:0]];
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    
    _selectedIndex = indexPath.row;
    
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    cell.accessoryType = UITableViewCellAccessoryCheckmark;
    
    self.game = _games[indexPath.row];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    self.game = _games[[self.tableView indexPathForCell:sender].row];
}

@end
