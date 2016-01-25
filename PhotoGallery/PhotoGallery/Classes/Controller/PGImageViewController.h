//
//  PGImageViewController.h
//  PhotoGallery
//
//  Created by Santosh Kumar Sahoo on 25/01/16.
//  Copyright © 2016 Robosoft Technologies. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PGNetworkService.h"
#import "PGContentView.h"
#import "PGAlbumDetails.h"

@interface PGImageViewController : UIViewController<UIPageViewControllerDataSource,UIPageViewControllerDelegate>

@property (strong, nonatomic) PGAlbumDetails *album;
@property (assign, nonatomic) NSInteger  imageIndex;
@end
