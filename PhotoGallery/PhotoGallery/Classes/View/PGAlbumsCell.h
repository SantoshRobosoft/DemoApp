//
//  PGAlbumsCell.h
//  PhotoGallery
//
//  Created by Santosh Kumar Sahoo on 15/01/16.
//  Copyright © 2016 Robosoft Technologies. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PGNetworkService.h"
#import "PGAlbumDetails.h"

@interface PGAlbumsCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIImageView *albumIcon;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *countLabel;

@end
