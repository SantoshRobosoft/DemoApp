//
//  TBPerformOperation.h
//  TopBollywoodMovies
//
//  Created by Santosh Kumar Sahoo on 04/01/16.
//  Copyright © 2016 Robosoft Technologies. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TBURLParsingDelegate.h"
#import "TBMovies.h"
#import "imageDownloadDelegate.h"

@interface TBPerformOperation : NSOperation
@property (strong, nonatomic) NSString * movieURL;
@property (strong, nonatomic) NSString * operation;
@property (assign, nonatomic) id<TBURLParsingDelegate> delegate;
@property (assign, nonatomic) id<imageDownloadDelegate> downloadDelegate;
-(instancetype) initWithURL:(NSString *)url;
@end
