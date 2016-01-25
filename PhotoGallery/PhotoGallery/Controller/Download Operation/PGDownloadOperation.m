//
//  PGDownloadOperation.m
//  PhotoGallery
//
//  Created by Santosh Kumar Sahoo on 25/12/15.
//  Copyright © 2015 Robosoft Technologies. All rights reserved.
//

#import "PGDownloadOperation.h"

@implementation PGDownloadOperation
/**
    @brief This method is nitialize the Delegate(cell) and the url sended by the cell
    @param NSString and (id<albumDelegate>)
 */
- (instancetype) initWithUrl:(NSString *)imageURL forDelegate:(id<albumDelegate>)delegate {
    self=[super init];
    if (self) {
        self.imageURL=imageURL;
        self.delegate=delegate;
    }
    return self;
}
- (void) main {
    if (self.imageURL) {
        NSURL *URL = [NSURL URLWithString:self.imageURL];
        NSURLRequest *request = [NSURLRequest requestWithURL:URL];
        
        NSURLSession *session = [NSURLSession sharedSession];
        NSURLSessionDataTask *task = [session dataTaskWithRequest:request
                                                completionHandler:
                                      ^(NSData *data, NSURLResponse *response, NSError *error) {
                                          if (!error) {
                                              if ([self.delegate respondsToSelector:@selector(didFinishDownload:)]) {
                                                  dispatch_async(dispatch_get_main_queue(), ^{
                                                      [self.delegate didFinishDownload:data];
                                                  });
                                              }
                                          }
                                      }];
        [task resume];
    }

}
@end
