//
//  ViewController.h
//  TopBollywoodMovies
//
//  Created by Santosh Kumar Sahoo on 04/01/16.
//  Copyright © 2016 Robosoft Technologies. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TBURLParsingDelegate.h"
#import "TBNetworkManager.h"
#import "TBMovieTableViewCell.h"
#import "TBMovieSummeryViewController.h"

@interface ViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,TBURLParsingDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSArray * moviesArray;
@end
