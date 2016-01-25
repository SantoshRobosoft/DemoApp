//
//  TBMovieSummeryViewController.h
//  TopBollywoodMovies
//
//  Created by Santosh Kumar Sahoo on 04/01/16.
//  Copyright © 2016 Robosoft Technologies. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TBMovieDetails.h"
#import "TBDataStoring.h"

@interface TBMovieSummeryViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *movieIcon;
@property (weak, nonatomic) IBOutlet UITextView *movieSummery;
@property (strong, nonatomic) TBMovieDetails * movidetails;
@end
