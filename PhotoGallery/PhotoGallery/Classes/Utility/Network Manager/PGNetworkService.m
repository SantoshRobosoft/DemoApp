//
//  PGNetworkService.m
//  PhotoGallery
//
//  Created by Santosh Kumar Sahoo on 25/12/15.
//  Copyright © 2015 Robosoft Technologies. All rights reserved.
//

#import "PGNetworkService.h"

/*
 Convenince class for JSON parsing and image downloading
 **/

@implementation PGNetworkService

/**
 @brief : this method is responsible for parsing the JSON data
 @param : hander as a block having NSArray and NSError as parameter
 */

- (void)doParseJsonData:(void(^)(NSArray *,NSError *)) handler {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSError *error=nil;
        NSMutableArray *albumDetailObject = [[NSMutableArray alloc]init];
        NSString *filePath = [[NSBundle mainBundle] pathForResource:@"albums"
                                                             ofType:@"json"];
        NSData *dataFromFile = [NSData dataWithContentsOfFile:filePath];
        NSDictionary *data = [NSJSONSerialization JSONObjectWithData:dataFromFile
                                                             options:kNilOptions
                                                               error:&error];
        if (error != nil) {
            NSLog(@"Error: was not able to load messages.");
        } else {
            PGAlbums *albumsObj=[[PGAlbums alloc]initWithAlbum:data];
            albumDetailObject = albumsObj.albumArray;
        }
        dispatch_async(dispatch_get_main_queue(), ^{
            handler(albumDetailObject,error);
        });
    });
}
/**
 @brief : this method is responsible for downloading image from url
 @param : NSString for image URL and a hander as a block having NSArray and NSError as parameter
 */

- (void)downloadImageFromUrl:(NSString *)imageUrl withHandler:(void(^)(NSData *,NSError *))handler {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        if (imageUrl) {    
            PGImageStore * savedImage =[PGImageStore sharedIntance];
            if ([savedImage.savedImageDictionary objectForKey:imageUrl]) {
                NSData *data = [NSData dataWithContentsOfFile:[savedImage.savedImageDictionary objectForKey:imageUrl]];
                dispatch_async(dispatch_get_main_queue(), ^{
                    handler(data,nil);
                });
            } else {
                NSURL *URL = [NSURL URLWithString:imageUrl];
                NSURLRequest *request = [NSURLRequest requestWithURL:URL];
                
                NSURLSession *session = [NSURLSession sharedSession];
                NSURLSessionDataTask *task = [session dataTaskWithRequest:request
                                                        completionHandler:
                                              ^(NSData *data, NSURLResponse *response, NSError *error) {
                                                  NSString *directory = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject];
                                                  static int i=0;
                                                  NSString *filepath=[NSString stringWithFormat:@"%@/%i",directory,i++];  //creating unique filePath for each image by appending an integer i to the end of file path
                                                  [data writeToFile:filepath atomically:YES];
                                                  [savedImage doSaveImagePath:filepath forURL:imageUrl];
                                                  dispatch_async(dispatch_get_main_queue(), ^{
                                                      handler(data,error);
                                                  });
                                              }];
                [task resume];
            }
        }
    });
}

@end
