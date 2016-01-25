//
//  PGAlbumDetails.h
//  PhotoGallery
//
//  Created by Santosh Kumar Sahoo on 24/12/15.
//  Copyright © 2015 Robosoft Technologies. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PGAlbums.h"

@interface PGAlbumDetails : NSObject
@property (strong,nonatomic) NSString * title;
@property (strong,nonatomic) NSString * albumDescription;
@property (strong,nonatomic) NSArray *imageArray;
- (instancetype) initWithDictionary:(NSDictionary *)albumDictionary;
@end

