//
//  PGAlbums.m
//  PhotoGallery
//
//  Created by Santosh Kumar Sahoo on 24/12/15.
//  Copyright © 2015 Robosoft Technologies. All rights reserved.
//

#import "PGAlbums.h"

@implementation PGAlbums
/**
    @brief This method is initalize the albumArray and added the pGAlbumDetails object to albumArray
    @param NSDictionary as parameter which contains a array as value
    @return returns a instance of PGAlbums type
*/
- (instancetype) initWithAlbum:(NSDictionary *)albumsDictionary {
    if (self=[super init]) {
        self.albumArray=[[NSMutableArray alloc]init];
    }
    for (NSDictionary *dic in [albumsDictionary objectForKey:@"Albums"]) {
        PGAlbumDetails *pGAlbumDetails=[[PGAlbumDetails alloc]initWithDictionary:dic];
        [self.albumArray addObject:pGAlbumDetails];
    }
    return self;
}
@end
