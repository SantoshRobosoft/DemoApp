//
//  TBMovieTableViewCell.h
//  TopBollywoodMovies
//
//  Created by Santosh Kumar Sahoo on 04/01/16.
//  Copyright © 2016 Robosoft Technologies. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TBMovieDetails.h"
#import "TBNetworkManager.h"
#import "imageDownloadDelegate.h"

@interface TBMovieTableViewCell : UITableViewCell<imageDownloadDelegate>
@property (weak, nonatomic) IBOutlet UILabel *count;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;
@property (weak, nonatomic) IBOutlet UIImageView *movieIcon;
@property (weak, nonatomic) IBOutlet UILabel *movieName;
@property (weak, nonatomic) IBOutlet UILabel *artistName;
@property (weak, nonatomic) IBOutlet UILabel *dateOfRelease;
@property (weak, nonatomic) IBOutlet UILabel *costOfMovie;

- (void) configureCellWithData : (id)data;
@end
