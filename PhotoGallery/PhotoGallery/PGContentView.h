//
//  PGContentView.h
//  PhotoGallery
//
//  Created by Santosh Kumar Sahoo on 25/01/16.
//  Copyright © 2016 Robosoft Technologies. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PGNetworkService.h"

@interface PGContentView : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *albumImageView;
- (void)doSetImageFromUrl:(NSString*)imageUrl ;

@end
