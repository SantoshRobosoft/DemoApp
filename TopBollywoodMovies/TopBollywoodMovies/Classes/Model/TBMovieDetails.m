//
//  TBMovieDetails.m
//  TopBollywoodMovies
//
//  Created by Santosh Kumar Sahoo on 04/01/16.
//  Copyright © 2016 Robosoft Technologies. All rights reserved.
//

#import "TBMovieDetails.h"

@implementation TBMovieDetails
/**
 @brief : Convenience method  for setting of a movie Details
 @param : movie is of NSDictionary type which contains the details about a movie
 @return : Return a instance of TBMovieDetails class
 */
- (instancetype) initWithMovieDetails: (NSDictionary *)movie {
    if(self=[super init]) {
        self.movieName = [[movie objectForKey:K_MovieName] objectForKey:K_LabelMovieName];
        self.artist = [[movie objectForKey:K_Artist] objectForKey:K_LabelArtist];
        self.price = [[movie objectForKey:K_Price] objectForKey:K_LabelPrice];
        self.summary = [[movie objectForKey:K_Summary] objectForKey:K_LabelSummary];
        self.releaseDate = [[[movie objectForKey:K_ReleaseDate] objectForKey:K_Attributes] objectForKey:K_LabelReleaseDate];
        self.imageURLArray = [movie objectForKey:K_ImageURLArray];
    }
    return self;
}
@end
