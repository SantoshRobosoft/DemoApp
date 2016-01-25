//
//  PGNetworkService.m
//  PhotoGallery
//
//  Created by Santosh Kumar Sahoo on 25/12/15.
//  Copyright © 2015 Robosoft Technologies. All rights reserved.
//

#import "PGNetworkService.h"

@implementation PGNetworkService
/**
    @brief return a single instance for PGNetworkService
 */
+ (instancetype) sharedInstance {
    static dispatch_once_t once;
    static PGNetworkService *sharedInstance;
    dispatch_once(&once, ^{
        sharedInstance = [PGNetworkService new];
        sharedInstance.operationQueue=[[NSOperationQueue alloc]init];
    });
    return sharedInstance;
}
/**
 @brief this method is responsible for sending request to PGDownloadOperation for download the image and add the request into operationQueue
 @param NSString for image URL and a delegate
 */
- (void) fetchDataFromURL:(NSString *) imageUrl forDelegate:(id<albumDelegate>)delegate {
    PGDownloadOperation *download=[[PGDownloadOperation alloc]initWithUrl:imageUrl forDelegate:delegate];
    [self.operationQueue addOperation:download];
}
@end
