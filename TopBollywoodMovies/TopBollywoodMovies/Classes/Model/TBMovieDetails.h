//
//  TBMovieDetails.h
//  TopBollywoodMovies
//
//  Created by Santosh Kumar Sahoo on 04/01/16.
//  Copyright © 2016 Robosoft Technologies. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TBConstants.h"

@interface TBMovieDetails : NSObject
@property (strong,nonatomic) NSString * movieName;
@property (strong,nonatomic) NSString * artist;
@property (strong,nonatomic) NSString * releaseDate;
@property (strong,nonatomic) NSString * price;
@property (strong,nonatomic) NSString * summary;
@property (strong,nonatomic) NSArray * imageURLArray;
- (instancetype) initWithMovieDetails: (NSDictionary *)movie;
@end
