//
//  PGNetworkService.h
//  PhotoGallery
//
//  Created by Santosh Kumar Sahoo on 25/12/15.
//  Copyright © 2015 Robosoft Technologies. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "albumDelegate.h"
#import "PGDownloadOperation.h"

@interface PGNetworkService : NSObject
@property (strong,nonatomic) NSOperationQueue *operationQueue;
+ (instancetype) sharedInstance;
- (void) fetchDataFromURL:(NSString *) imageUrl forDelegate:(id<albumDelegate>)delegate;
@end
