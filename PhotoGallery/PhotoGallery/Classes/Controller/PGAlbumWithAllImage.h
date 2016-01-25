//
//  PGAlbumWithAllImage.h
//  PhotoGallery
//
//  Created by Santosh Kumar Sahoo on 15/01/16.
//  Copyright © 2016 Robosoft Technologies. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PGAlbumDetails.h"
#import "PGAlbumImageCell.h"
#import "PGNetworkService.h"
#import "PGImageViewController.h"

@interface PGAlbumWithAllImage : UICollectionViewController
@property (strong, nonatomic) PGAlbumDetails * album;
@end
