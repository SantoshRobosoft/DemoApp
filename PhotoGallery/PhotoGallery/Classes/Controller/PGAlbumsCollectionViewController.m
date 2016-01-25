//
//  PGAlbumsCollectionViewController.m
//  PhotoGallery
//
//  Created by Santosh Kumar Sahoo on 14/01/16.
//  Copyright © 2016 Robosoft Technologies. All rights reserved.
//

#import "PGAlbumsCollectionViewController.h"

/*
 Convenience class to show all albums 
 **/

@interface PGAlbumsCollectionViewController ()

@property (strong, nonatomic) NSArray *albumArray;
@property (strong, nonatomic) PGNetworkService *networkService;

@end

@implementation PGAlbumsCollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.networkService=[[PGNetworkService alloc]init];
    [_networkService doParseJsonData:^(NSArray * Data, NSError *error) {
        self.albumArray = Data;
        [self.collectionView reloadData];
    }];
}

- (void) dataSuccessfullyParsed : (id) data {
    if ([data isKindOfClass:[NSArray class]]) {
       self.albumArray = data;
        [self.collectionView reloadData];
    }
}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _albumArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    PGAlbumsCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"album" forIndexPath:indexPath];
    [cell.activityIndicator startAnimating];
    PGAlbumDetails *details = [_albumArray objectAtIndex:indexPath.row];
    NSString *url = [details.imageArray objectAtIndex:0];
    cell.albumIcon.image = nil;
    [_networkService downloadImageFromUrl:url withHandler:^(NSData * data,NSError * error) {
        if (!error) {
            [cell.activityIndicator stopAnimating];
            [cell.albumIcon setImage:[UIImage imageWithData:data]];
            cell.titleLabel.text = details.title;
            cell.countLabel.text = [NSString stringWithFormat:@"items : %ld",[details.imageArray count]];
        } else {
            [cell.albumIcon setImage:[UIImage imageNamed:@"fail.png"]];
            NSLog(@"Error : %@",[error description]);
        }
    }];
    return cell;
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    PGAlbumWithAllImage *obj=[[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"allAlbum"];
    obj.album=[_albumArray objectAtIndex:indexPath.row];
    [self.navigationController pushViewController:obj animated:YES];
}

#pragma mark - UICollectionViewDelegateFlowLayout()
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
        if (indexPath.row==0) {
            return CGSizeMake(390, 200);
        } else {
            return CGSizeMake(192, 200);
        }
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
