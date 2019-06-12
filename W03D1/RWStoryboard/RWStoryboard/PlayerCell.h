////  PlayerCell.h
// Created: 2019-06-11
//


#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface PlayerCell : UITableViewCell

@property (nonatomic, weak) IBOutlet UILabel *nameLabel;
@property (nonatomic, weak) IBOutlet UILabel *gameLabel;
@property (nonatomic, weak) IBOutlet UIImageView *ratingImageView;

@end

NS_ASSUME_NONNULL_END
