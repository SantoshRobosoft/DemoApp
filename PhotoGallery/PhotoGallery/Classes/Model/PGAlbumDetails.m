//
//  PGAlbumDetails.m
//  PhotoGallery
//
//  Created by Santosh Kumar Sahoo on 24/12/15.
//  Copyright © 2015 Robosoft Technologies. All rights reserved.
//

#import "PGAlbumDetails.h"

@implementation PGAlbumDetails
/**
 @brief : This method is initalize the title,albumDescription and imageArray
 @param : NSDictionary as parameter which contains album details
 @return : returns a instance of PGAlbumDetails type
 */

- (instancetype) initWithDictionary:(NSDictionary *)albumDictionary {
    if (self=[super init]) {
        self.title = [albumDictionary objectForKey:@"Title"];
        self.albumDescription = [albumDictionary objectForKey:@"Desc"];
        self.imageArray = [albumDictionary objectForKey:@"images"];
    }
    return self;
}
@end
