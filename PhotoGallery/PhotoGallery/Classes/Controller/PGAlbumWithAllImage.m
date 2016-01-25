//
//  PGAlbumWithAllImage.m
//  PhotoGallery
//
//  Created by Santosh Kumar Sahoo on 15/01/16.
//  Copyright © 2016 Robosoft Technologies. All rights reserved.
//

#import "PGAlbumWithAllImage.h"

@interface PGAlbumWithAllImage ()

@property (strong, nonatomic) NSArray * imageUrlArray;
@property (strong, nonatomic) PGNetworkService *networkService;
@end

@implementation PGAlbumWithAllImage

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    self.imageUrlArray = _album.imageArray;
    self.networkService = [[PGNetworkService alloc]init];
}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _imageUrlArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    PGAlbumImageCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"albumImageCell" forIndexPath:indexPath];
    [cell.activityIndicator startAnimating];
    cell.albumImages.image = nil;
    [_networkService downloadImageFromUrl:[self.imageUrlArray objectAtIndex:indexPath.row] withHandler:^(NSData * data,NSError *error) {
        if (!error) {
            [cell.activityIndicator stopAnimating];
            cell.albumImages.image = [UIImage imageWithData:data];
        } else {
            [cell.albumImages setImage:[UIImage imageNamed:@"fail.png"]];
            NSLog(@"%@",[error description]);
        }
    }];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    PGImageViewController *obj=[[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"imageViewController"];
    obj.album = _album;
    obj.imageIndex = indexPath.row;
    [self.navigationController pushViewController:obj animated:YES];
}

#pragma mark - UICollectionViewDelegateFlowLayout()
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(192, 200);
}
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(10, 10, 10, 10);
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return 10;
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return 10;
}

@end
