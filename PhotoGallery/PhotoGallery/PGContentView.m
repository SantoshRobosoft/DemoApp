//
//  PGContentView.m
//  PhotoGallery
//
//  Created by Santosh Kumar Sahoo on 25/01/16.
//  Copyright © 2016 Robosoft Technologies. All rights reserved.
//

#import "PGContentView.h"

@interface PGContentView ()

@end

@implementation PGContentView

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (void)doSetImageFromUrl:(NSString*)imageUrl  {
    self.albumImageView.image =nil;
    PGNetworkService *networkService = [[PGNetworkService alloc]init];
    [networkService downloadImageFromUrl:imageUrl withHandler:^(NSData *data, NSError *error) {
        [self.albumImageView setImage:[UIImage imageWithData:data]];
    }];
}


@end
