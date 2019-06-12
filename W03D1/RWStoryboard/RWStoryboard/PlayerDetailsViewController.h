////  PlayerDetailsViewController.h
// Created: 2019-06-11
//


#import <UIKit/UIKit.h>
@class Player;
@class PlayerDetailsViewController;

NS_ASSUME_NONNULL_BEGIN

@protocol PlayerDetailsViewControllerDelegate <NSObject>
- (void)playerDetailsViewControllerDidCancel:(PlayerDetailsViewController *)controller;
- (void)playerDetailsViewControllerDidSave:(PlayerDetailsViewController *)controller didAddPlayer:(Player *) player;
@end

@interface PlayerDetailsViewController : UITableViewController
@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (nonatomic, weak) id <PlayerDetailsViewControllerDelegate> delegate;
@property (weak, nonatomic) IBOutlet UILabel *detailLabel;


@end

NS_ASSUME_NONNULL_END
