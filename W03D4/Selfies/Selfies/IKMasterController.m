////  IKMasterController.m
// Created: 2019-06-12
//


#import "IKMasterController.h"
#import "IKMasterCell.h"
#import "IKSectionHeaderCell.h"
#import "ImageService.h"
#import "Photo.h"

enum IKCollectionCategory {
    Summer,
    Rainy
};

@interface IKMasterController ()

@end

@implementation IKMasterController {
    //NSMutableArray *images;
    NSArray *tags;
}


static NSString * const reuseIdentifier = @"GridCell";
static NSString * const api_key = @"";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSLog(@"Reuse id: %@",reuseIdentifier);
   // images = [ImageService defaultInstance].images;
    tags = @[@"cats",@"dogs"];
    self.images = [NSMutableArray new];
    
    for(NSString *tag in tags) {
        NSMutableArray* tagImages = [NSMutableArray new];
        [self.images addObject:tagImages];
    
        NSURL *url = [NSURL URLWithString:[NSString stringWithFormat: @"https://api.flickr.com/services/rest/?method=flickr.photos.search&format=json&nojsoncallback=1&api_key=%@&tags=%@",api_key,tag]];
        NSURLRequest *request = [NSURLRequest requestWithURL:url];
        
        NSURLSessionDataTask *task = [[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
            if (error) {
                NSLog(@"Got an error! %@", error);
                return;
            }
            
            NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
            if (httpResponse.statusCode != 200) {
                NSLog(@"Server responded with a non 200 status");
                return;
            }
            
            NSError *jsonError;
            NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
            
            if (jsonError) {
                NSLog(@"Error parsing the JSON response: %@", jsonError);
                return;
            }
            
            NSDictionary *photosDictionary = json[@"photos"];
            NSArray *photoArray = photosDictionary[@"photo"];
            
            NSMutableArray *photos = [NSMutableArray array];
            for (NSDictionary *photoJSON in photoArray) {
                Photo *photo = [Photo parseJSONDictionary:photoJSON];
                NSString* farmId = photoJSON[@"farm"];
                NSString* server = photoJSON[@"server"];
                NSString* photoId = photoJSON[@"id"];
                NSString* secret = photoJSON[@"secret"];
                NSString *photoUrl = [NSString stringWithFormat:@"https://farm%@.staticflickr.com/%@/%@_%@.jpg",farmId,server,photoId,secret];
                NSLog(@"Link: %@",photoUrl);
                [photos addObject:photo];
                
                [self downloadImage:photoUrl toImages:tagImages];
            }
            //self.photos = photos;
        }];
         [task resume];
    }
   
    
    // ** PLEASE COMMENT REGISTERCLASS SINCE WE ARE USING THE INTERFACE BUILDER!!! ** //
    // Register cell classes
    //[self.collectionView registerClass:[IKMasterCell class] forCellWithReuseIdentifier:reuseIdentifier];
}

-(void) downloadImage:(NSString *)photoUrl toImages:(NSMutableArray *) images {
    NSURL *url = [NSURL URLWithString:photoUrl];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    NSURLSessionDataTask *task = [[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            NSLog(@"Got an error! %@", error);
            return;
        }
        
        NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
        if (httpResponse.statusCode != 200) {
            NSLog(@"Server responded with a non 200 status");
            return;
        }
        
        UIImage *image = [UIImage imageWithData:data];
        [images addObject:image];
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            [self.collectionView reloadData];
        }];
    }];
    [task resume];
}

- (IBAction)segmentChanged:(UISegmentedControl *)sender {
    
    UICollectionViewLayoutAttributes *attributes = [self.collectionView.collectionViewLayout layoutAttributesForSupplementaryViewOfKind:UICollectionElementKindSectionHeader atIndexPath:[NSIndexPath indexPathForItem:0 inSection:sender.selectedSegmentIndex]];
    
    [self.collectionView setContentOffset:CGPointMake(0, attributes.frame.origin.y - self.collectionView.contentInset.top - self.collectionView.safeAreaInsets.top) animated: true];
}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    NSLog(@"WE have %lu sections", (unsigned long)[self.images count]);
    return [self.images count];
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [self.images[section] count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {

    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"GridCell" forIndexPath:indexPath];
    [((IKMasterCell*)cell).imageView setImage: self.images[indexPath.section][indexPath.row]];
    
    return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    if([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        IKSectionHeaderCell *cell = (IKSectionHeaderCell *)[collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"SectionHeaderCell" forIndexPath:indexPath];
        cell.headerLabel.text = tags[indexPath.section];
//        switch(indexPath.section) {
//            case Summer:
//                cell.headerLabel.text = @"Summer";
//                break;
//            case Rainy:
//                cell.headerLabel.text = @"Rainy";
//            default:
//                break;
//        }
        return cell;
    }
    return nil;
}

@end
