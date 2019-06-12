////  PlayersTableViewController.h
// Created: 2019-06-11
//


#import <UIKit/UIKit.h>
@class Player;

NS_ASSUME_NONNULL_BEGIN

@interface PlayersViewController : UITableViewController

@property (nonatomic, strong) NSMutableArray<Player *> *players;

@end

NS_ASSUME_NONNULL_END
