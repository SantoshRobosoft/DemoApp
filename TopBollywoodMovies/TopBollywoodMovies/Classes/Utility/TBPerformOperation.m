//
//  TBPerformOperation.m
//  TopBollywoodMovies
//
//  Created by Santosh Kumar Sahoo on 04/01/16.
//  Copyright © 2016 Robosoft Technologies. All rights reserved.
//

#import "TBPerformOperation.h"
#import "TBDataStoring.h"

@implementation TBPerformOperation
-(instancetype) initWithURL:(NSString *)url  {
    self=[super init];
    if (self) {
        self.movieURL=url;
    }
    return self;
}
- (void) main {
    if(_movieURL) {
        NSURL *url=[NSURL URLWithString:_movieURL];
        NSURLRequest *request=[NSURLRequest requestWithURL:url];
        NSURLSession *session=[NSURLSession sharedSession];
        TBDataStoring *obj=[TBDataStoring sharedInstance];
        //checking Whether image is present in NSCachesDirectory or not
        if ([obj.savedDataDictionary objectForKey:_movieURL] && [_operation isEqualToString:@"downloading"]) {
            //Data is present in CacheMemory
            [NSOperationQueue.mainQueue addOperationWithBlock:^{
                NSData *data=[NSData dataWithContentsOfFile:[obj.savedDataDictionary objectForKey:_movieURL]];
                [self.downloadDelegate didFinishDownload:data];
            }];
        } else {
            //Data is not present in CacheMemory or operation is of parsing type
            NSURLSessionDataTask *task=[session dataTaskWithRequest:request completionHandler:^(NSData *  data, NSURLResponse *  response, NSError *  error) {
                if (!error) {
                    if ([_operation isEqualToString:@"parsing"]) {
                        //JSON Data is going download and Parse
                        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];
                        [self doParseWithData:dic];
                    } else {
                        //after download completion data is going to store in NSCachesDirectory
                        NSString *directory = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject];
                        static int i=0;
                        NSString *filepath=[NSString stringWithFormat:@"%@/%i",directory,i++];  //creating unique filePath for each image by appending an integer i to the end of file path
                        [data writeToFile:filepath atomically:YES];
                        [obj doSaveData:filepath forURL:_movieURL];
                        if ([self.downloadDelegate respondsToSelector:@selector(didFinishDownload:)]) {
                            dispatch_async(dispatch_get_main_queue(), ^{
                                [self.downloadDelegate didFinishDownload:data];
                            });
                        }
                    }
                } else if ([_operation isEqualToString:@"parsing"] && [self.downloadDelegate respondsToSelector:@selector(didFailure:)]) {
                    //If any Failure occure
                    dispatch_async(dispatch_get_main_queue(), ^{
                        [self.downloadDelegate didFailure:error];
                    });
                } else {
                    dispatch_async(dispatch_get_main_queue(), ^{
                        [self.delegate didParseFailed:error];
                    });
                }
            }];
            [task resume];
        }
    }
}
/**
 @brief : this method is going to intract with Model Classes to Parse the Downloaded JSON Data
 @param : dictionary is of NSDictionary type which is Serialized JSON data
 */
- (void) doParseWithData:(NSDictionary *)dictionary {
    TBMovies *obj = [[TBMovies alloc]initWithMovies:dictionary];
    if ([self.delegate respondsToSelector:@selector(didParseSuccessfully:)]) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.delegate didParseSuccessfully:obj.movieArray];
        });
    }
}
- (void) dealloc {
    self.delegate=nil;
    self.downloadDelegate=nil;
}
@end
