//
//  albumDelegate.h
//  PhotoGallery
//
//  Created by Santosh Kumar Sahoo on 25/12/15.
//  Copyright © 2015 Robosoft Technologies. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol albumDelegate <NSObject>
@required
- (void) didFinishDownload:(NSData *)data;
- (void) didFailureWithError:(NSError *)error;
@end
