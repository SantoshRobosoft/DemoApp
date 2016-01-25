//
//  TBNetworkManager.m
//  TopBollywoodMovies
//
//  Created by Santosh Kumar Sahoo on 04/01/16.
//  Copyright © 2016 Robosoft Technologies. All rights reserved.
//

#import "TBNetworkManager.h"

@implementation TBNetworkManager
+ (instancetype) sharedInstance {
    static dispatch_once_t once;
    static TBNetworkManager *sharedInstance;
    dispatch_once(&once, ^{
        sharedInstance = [TBNetworkManager new];
        sharedInstance.operationQueue=[[NSOperationQueue alloc]init];
    });
    return sharedInstance;
}
/**
 @brief : This method is responsible for  creatining a TBPerformOperation(subClass on              NSOperation) instance by initializing the url and delegate, then add it to operationQueue
 @param :  urlString is of NSString type from which we have to fetch the JSON data ,delegate is of ViewController
 */
- (void) doParsingDataWithUrl:(NSString *)urlString forDelegate:(id<TBURLParsingDelegate>)delegate {
    TBPerformOperation *obj=[[TBPerformOperation alloc]initWithURL:urlString];
    obj.delegate=delegate;
    obj.operation=@"parsing";
    [self.operationQueue addOperation:obj];
}
/**
 @brief : This method is responsible for  creatining a TBPerformOperation(subClass on NSOperation) instance by initializing the url and delegate, then add it to operationQueue
 @param : urlString is of NSString type from which we have to download the image data ,delegate is of TBMovieTableViewCell
 */
- (void) doDownloadWithurl:(NSString *)urlString forDelegate:(id<imageDownloadDelegate>)delegate {
    TBPerformOperation *obj=[[TBPerformOperation alloc]initWithURL:urlString];
    obj.operation=@"downloading";
    obj.downloadDelegate=delegate;
    [self.operationQueue addOperation:obj];
}
@end
