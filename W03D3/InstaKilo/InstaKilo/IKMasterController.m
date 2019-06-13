////  IKMasterController.m
// Created: 2019-06-12
//


#import "IKMasterController.h"
#import "IKMasterCell.h"
#import "IKSectionHeaderCell.h"
#import "ImageService.h"

enum IKCollectionCategory {
    Summer,
    Rainy
};

@interface IKMasterController ()

@end

@implementation IKMasterController {
    NSArray *images;
}


static NSString * const reuseIdentifier = @"GridCell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSLog(@"Reuse id: %@",reuseIdentifier);
    images = [ImageService defaultInstance].images;
    
    // ** PLEASE COMMENT REGISTERCLASS SINCE WE ARE USING THE INTERFACE BUILDER!!! ** //
    // Register cell classes
    //[self.collectionView registerClass:[IKMasterCell class] forCellWithReuseIdentifier:reuseIdentifier];
}


- (IBAction)segmentChanged:(UISegmentedControl *)sender {
    
    UICollectionViewLayoutAttributes *attributes = [self.collectionView.collectionViewLayout layoutAttributesForSupplementaryViewOfKind:UICollectionElementKindSectionHeader atIndexPath:[NSIndexPath indexPathForItem:0 inSection:sender.selectedSegmentIndex]];
    
    [self.collectionView setContentOffset:CGPointMake(0, attributes.frame.origin.y - self.collectionView.contentInset.top - self.collectionView.safeAreaInsets.top) animated: true];
}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return [images count];
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [images[section] count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {

    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"GridCell" forIndexPath:indexPath];
    [((IKMasterCell*)cell).imageView setImage: images[indexPath.section][indexPath.row]];
    
    return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    if([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        IKSectionHeaderCell *cell = (IKSectionHeaderCell *)[collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"SectionHeaderCell" forIndexPath:indexPath];
        switch(indexPath.section) {
            case Summer:
                cell.headerLabel.text = @"Summer";
                break;
            case Rainy:
                cell.headerLabel.text = @"Rainy";
            default:
                break;
        }
        return cell;
    }
    return nil;
}

@end
