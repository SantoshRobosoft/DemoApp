//
//  ViewController.h
//  PhotoGallery
//
//  Created by Santosh Kumar Sahoo on 24/12/15.
//  Copyright © 2015 Robosoft Technologies. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PGAlbumDetails.h"
#import "PGAlbums.h"
#import "PGAlbumsCell.h"

@interface ViewController : UIViewController<UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property (weak, nonatomic) IBOutlet UINavigationBar *albumNavigationBar;
//@property (weak, nonatomic) IBOutlet UINavigationItem *albumTitle;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *Back;
- (IBAction)didtapBack:(UIBarButtonItem *)sender;
@property (weak, nonatomic) IBOutlet UICollectionView *albumsCollectionView;
@property (strong,nonatomic) PGAlbums *albums;
@property (strong,nonatomic) NSMutableArray * imageArray;
@property (assign,nonatomic) NSInteger page;
@end

