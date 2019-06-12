////  PlayerDetailsViewController.m
// Created: 2019-06-11
//


#import "PlayerDetailsViewController.h"
#import "GamePickerViewController.h"
#import "Player.h"

@interface PlayerDetailsViewController ()

@end

@implementation PlayerDetailsViewController {
    NSString *_game;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    _game = @"Chess";
    self.detailLabel.text  = _game;
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (IBAction)done:(id)sender {
    {
        Player *player = [[Player alloc] init];
        player.name = self.nameTextField.text;
        player.game = _game;
        player.rating = 1;
        [self.delegate playerDetailsViewControllerDidSave:self didAddPlayer:player];
    }
}
- (IBAction)cancel:(id)sender {
    [self.delegate playerDetailsViewControllerDidCancel:self];
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0 ) {
        [self.nameTextField becomeFirstResponder];
    }
}

- (IBAction) unwindToRootViewController: (UIStoryboardSegue *) segue {
    NSLog(@"Selected a category in %@",segue.sourceViewController);
    
    if( [segue.sourceViewController isKindOfClass:[GamePickerViewController class]]) {
        _game = ((GamePickerViewController*) segue.sourceViewController).game;
        self.detailLabel.text = _game;
        
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"PickGame"]) {
        GamePickerViewController *gamePickerViewController = segue.destinationViewController;
        gamePickerViewController.game = _game;
    }
}

@end
