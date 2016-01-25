//
//  PGAlbums.h
//  PhotoGallery
//
//  Created by Santosh Kumar Sahoo on 24/12/15.
//  Copyright © 2015 Robosoft Technologies. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PGAlbumDetails.h"

@interface PGAlbums : NSObject
@property (strong,nonatomic) NSMutableArray *albumArray;
- (instancetype) initWithAlbum:(NSDictionary *)albumsDictionary;
@end
