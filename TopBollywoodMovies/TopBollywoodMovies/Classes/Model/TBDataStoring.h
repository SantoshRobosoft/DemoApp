//
//  TBDataStoring.h
//  TopBollywoodMovies
//
//  Created by Santosh Kumar Sahoo on 04/01/16.
//  Copyright © 2016 Robosoft Technologies. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TBDataStoring : NSObject
@property(strong, nonatomic) NSMutableDictionary *savedDataDictionary;
+ (instancetype) sharedInstance;
- (void) doSaveData:(NSString *)filePath forURL:(NSString *)url;
@end
