////  SummaryTaskCell.h
// Created: 2019-06-11
//


#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SummaryTaskCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *priorityLabel;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *detailLabel;
@property (weak, nonatomic) IBOutlet UIButton *taskCheckBox;

@end

NS_ASSUME_NONNULL_END
