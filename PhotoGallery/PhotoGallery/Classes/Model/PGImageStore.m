//
//  PGImageStore.m
//  PhotoGallery
//
//  Created by Santosh Kumar Sahoo on 25/01/16.
//  Copyright © 2016 Robosoft Technologies. All rights reserved.
//

#import "PGImageStore.h"

/*
 Convenince class for storing image filepath which are once downloaded
 **/

@implementation PGImageStore

/**
 @brief : convenience method to allocate memory for savedImageDictionary  create single instance  for PGImageStore
 @return : returns a Instance of PGImageStore
 */

+ (instancetype) sharedIntance {
    static dispatch_once_t once;
    static PGImageStore *sharedInstance;
    dispatch_once(&once, ^{
        sharedInstance = [PGImageStore new];
        sharedInstance.savedImageDictionary=[[NSMutableDictionary alloc]init];
    });
    return sharedInstance;
}
/**
 @brief : convenience method to save the filePath for downloaded image with respective URL
 @param : filePath is a type of NSString and holds the filePath for downloaded image and url is also a NSString type which holds the respective URL
 */

- (void) doSaveImagePath:(NSString *)filePath forURL:(NSString *)url {
    [self.savedImageDictionary setValue:filePath forKey:url];
}

@end
