//
//  PGNetworkService.h
//  PhotoGallery
//
//  Created by Santosh Kumar Sahoo on 25/12/15.
//  Copyright © 2015 Robosoft Technologies. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PGAlbums.h"
#import "PGImageStore.h"

@interface PGNetworkService : NSObject

- (void)doParseJsonData:(void(^)(NSArray *,NSError *))handler;
- (void)downloadImageFromUrl:(NSString *)imageUrl withHandler:(void(^)(NSData *,NSError *))handler;

@end
