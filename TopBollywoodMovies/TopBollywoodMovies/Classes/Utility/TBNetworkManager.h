//
//  TBNetworkManager.h
//  TopBollywoodMovies
//
//  Created by Santosh Kumar Sahoo on 04/01/16.
//  Copyright © 2016 Robosoft Technologies. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TBURLParsingDelegate.h"
#import "TBPerformOperation.h"
#import "imageDownloadDelegate.h"

@interface TBNetworkManager : NSObject
@property (strong, nonatomic) NSOperationQueue * operationQueue;
+ (instancetype) sharedInstance;
- (void) doParsingDataWithUrl:(NSString *)urlString forDelegate:(id<TBURLParsingDelegate>)delegate;
- (void) doDownloadWithurl:(NSString *)urlString forDelegate:(id<imageDownloadDelegate>)delegate;
@end
