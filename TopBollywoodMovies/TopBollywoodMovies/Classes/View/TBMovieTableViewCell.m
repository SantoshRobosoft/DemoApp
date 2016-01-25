//
//  TBMovieTableViewCell.m
//  TopBollywoodMovies
//
//  Created by Santosh Kumar Sahoo on 04/01/16.
//  Copyright © 2016 Robosoft Technologies. All rights reserved.
//

#import "TBMovieTableViewCell.h"

@implementation TBMovieTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}
/**
 @brief : This method is responsible to Configure the Cell
 @param : It takes id as parameter (this is probabily of type TBMovieDetails )
 */
- (void) configureCellWithData : (id)data {
    //UIView* separatorLineView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, 2)];  //code for  grySeparator  between cell
    UIView* separatorLineView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 740, 2)];
    separatorLineView.backgroundColor = [UIColor grayColor];
    [self.contentView addSubview:separatorLineView];
    TBMovieDetails *obj=data;
    [self.activityIndicator setHidden:NO];
    [self.activityIndicator startAnimating];
    self.movieName.text = obj.movieName;
    self.artistName.text = obj.artist;
    self.dateOfRelease.text = obj.releaseDate;
    self.costOfMovie.text = obj.price;
    NSString *url=[[[obj imageURLArray] objectAtIndex:2] objectForKey:@"label"];    //uses the 3rd url for better Quality
    TBNetworkManager *networkManager=[TBNetworkManager sharedInstance];
    [networkManager doDownloadWithurl:url  forDelegate:self];
}
#pragma mark - imageDownloadDelegate
/**
 @brief : executed when data downloaded successfully in TBPerformOperation
 @param : data of NSdata type is either downloaded data or data from NSCacheDirectory
 */
-(void) didFinishDownload : (NSData *)data {
    [self.activityIndicator stopAnimating];
    [self.activityIndicator setHidden:YES];
    [self.movieIcon setImage:[UIImage imageWithData:data]];
    [self reloadInputViews];
}
/**
 @brief : executed when data downloaded Failed in TBPerformOperation
 @param : error is of NSError type which contains the error details;
 */
- (void) didFailure :(NSError *)error {
    NSLog(@"Error : %@ ",error);
}
@end
