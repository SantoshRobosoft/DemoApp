//
//  PGAlbumsCell.h
//  PhotoGallery
//
//  Created by Santosh Kumar Sahoo on 25/12/15.
//  Copyright © 2015 Robosoft Technologies. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "albumDelegate.h"
#import "PGNetworkService.h"

@interface PGAlbumsCell : UICollectionViewCell<albumDelegate>
- (void) configureCell:(NSString *)imageURL;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *cellactivityIndicator;
@property (weak, nonatomic) IBOutlet UILabel *albumName;
@property (weak, nonatomic) IBOutlet UILabel *imageCount;
@property (weak, nonatomic) IBOutlet UILabel *imageDesc;
@property (weak, nonatomic) IBOutlet UIImageView *cellImage;
@end
