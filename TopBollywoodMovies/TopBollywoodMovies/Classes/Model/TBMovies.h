//
//  TBMovies.h
//  TopBollywoodMovies
//
//  Created by Santosh Kumar Sahoo on 04/01/16.
//  Copyright © 2016 Robosoft Technologies. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TBMovieDetails.h"
#import "TBConstants.h"

@interface TBMovies : NSObject
@property (strong,nonatomic) NSMutableArray *movieArray;
- (instancetype) initWithMovies: (NSDictionary *)movies;
@end
