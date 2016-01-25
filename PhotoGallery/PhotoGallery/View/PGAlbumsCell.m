//
//  PGAlbumsCell.m
//  PhotoGallery
//
//  Created by Santosh Kumar Sahoo on 25/12/15.
//  Copyright © 2015 Robosoft Technologies. All rights reserved.
//

#import "PGAlbumsCell.h"

@implementation PGAlbumsCell
#pragma mark - Utility Method
/**
    @brief this method is responsible to configure the cell 
    @param  NSStriing as url of image
 */
- (void) configureCell:(NSString *)imageURL {
    PGNetworkService *networkService=[PGNetworkService sharedInstance];
    [networkService fetchDataFromURL:imageURL forDelegate:self];
}
#pragma mark - albumDelegate methods
/** 
    @brief this is an albumDelegate methond, will be called when data downloaded Successfully
    @param It take NSData as parameter which was downloaded
 */
- (void) didFinishDownload:(NSData *)data {
    [self.cellactivityIndicator stopAnimating];
    [self.cellactivityIndicator setHidden:YES];
    CGRect s=[self bounds];
    //UIImage *image=[UIImage imageWithData:data];
    [self.cellImage setFrame:s];
    [self.cellImage setImage:[UIImage imageWithData:data]];
}
/**
 @brief this is an albumDelegate methond, will be called when download Fails
 @param It take NSError as parameter
 */
- (void) didFailureWithError:(NSError *)error {
    
}
@end
