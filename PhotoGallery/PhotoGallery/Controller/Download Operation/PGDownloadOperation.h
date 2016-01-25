//
//  PGDownloadOperation.h
//  PhotoGallery
//
//  Created by Santosh Kumar Sahoo on 25/12/15.
//  Copyright © 2015 Robosoft Technologies. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "albumDelegate.h"

@interface PGDownloadOperation : NSOperation
@property (strong, nonatomic) NSString *imageURL;
@property (strong, nonatomic)id <albumDelegate> delegate;
- (instancetype) initWithUrl:(NSString *)imageURL forDelegate:(id<albumDelegate>)delegate;
@end
