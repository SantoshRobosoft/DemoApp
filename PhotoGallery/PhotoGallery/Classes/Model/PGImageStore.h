//
//  PGImageStore.h
//  PhotoGallery
//
//  Created by Santosh Kumar Sahoo on 25/01/16.
//  Copyright © 2016 Robosoft Technologies. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PGImageStore : NSObject

@property (strong, nonatomic) NSMutableDictionary *savedImageDictionary;

+ (instancetype) sharedIntance ;
- (void) doSaveImagePath:(NSString *)filePath forURL:(NSString *)url;

@end
