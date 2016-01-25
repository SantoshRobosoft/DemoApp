//
//  TBMovies.m
//  TopBollywoodMovies
//
//  Created by Santosh Kumar Sahoo on 04/01/16.
//  Copyright © 2016 Robosoft Technologies. All rights reserved.
//

#import "TBMovies.h"

@implementation TBMovies
/**
 @brief : This method is rsponsible for creating and keeping the object of TBMovieDetails(which contains details about a movie)
 @param : movies is of a NSDictionary type which contains a number of movie Details
 @return : Return a instance of TBMovies class
 */
- (instancetype) initWithMovies: (NSDictionary *)movies {
    if (self=[super init]) {
        self.movieArray = [[NSMutableArray alloc]init];
    }
    NSDictionary *dic1= [movies objectForKey:K_Feed];
    for (NSDictionary * dic in [dic1 objectForKey:K_Entry]) {
        TBMovieDetails *obj=[[TBMovieDetails alloc]initWithMovieDetails:dic];
        [self.movieArray addObject:obj];
    }
    return self;
}
@end
