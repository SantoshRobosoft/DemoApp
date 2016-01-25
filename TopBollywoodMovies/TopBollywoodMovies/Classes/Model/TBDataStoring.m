//
//  TBDataStoring.m
//  TopBollywoodMovies
//
//  Created by Santosh Kumar Sahoo on 04/01/16.
//  Copyright © 2016 Robosoft Technologies. All rights reserved.
//

#import "TBDataStoring.h"

@implementation TBDataStoring
/**
    @brief : convenience method to allocate memory for savedDataDictionary  create single instance  for TBDataStoring
    @return : returns a Instance of TBDataStoring
 */
+ (instancetype) sharedInstance {
    static dispatch_once_t once;
    static TBDataStoring *sharedInstance;
    dispatch_once(&once, ^{
        sharedInstance = [TBDataStoring new];
        sharedInstance.savedDataDictionary=[[NSMutableDictionary alloc]init];
    });
    return sharedInstance;
}
/**
    @brief : convenience method to save the filePath for downloaded Data with respective URL
    @param : filePath is a type of NSString and holds the filePath for downloaded data and url is also a NSString type which holds the respective URL
 */
- (void) doSaveData:(NSString *)filePath forURL:(NSString *)url {
    [self.savedDataDictionary setValue:filePath forKey:url];
}
@end
