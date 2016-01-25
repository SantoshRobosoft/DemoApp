//
//  imageDownloadDelegate.h
//  TopBollywoodMovies
//
//  Created by Santosh Kumar Sahoo on 04/01/16.
//  Copyright © 2016 Robosoft Technologies. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol imageDownloadDelegate <NSObject>
@required
-(void) didFinishDownload : (NSData *)data;
- (void) didFailure :(NSError *)error;
@end
