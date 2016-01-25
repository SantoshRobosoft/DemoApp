//
//  PGAlbumImageCell.h
//  PhotoGallery
//
//  Created by Santosh Kumar Sahoo on 15/01/16.
//  Copyright © 2016 Robosoft Technologies. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PGNetworkService.h"
#import "PGAlbumDetails.h"

@interface PGAlbumImageCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIImageView *albumImages;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;

@end
