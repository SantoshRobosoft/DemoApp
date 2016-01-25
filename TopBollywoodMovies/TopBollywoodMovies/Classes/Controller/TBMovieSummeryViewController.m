//
//  TBMovieSummeryViewController.m
//  TopBollywoodMovies
//
//  Created by Santosh Kumar Sahoo on 04/01/16.
//  Copyright © 2016 Robosoft Technologies. All rights reserved.
//

#import "TBMovieSummeryViewController.h"

@interface TBMovieSummeryViewController ()

@end

@implementation TBMovieSummeryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title=[_movidetails movieName];
    self.movieSummery.text = [_movidetails summary];
    TBDataStoring *obj=[TBDataStoring sharedInstance];
    NSString *url=[[[_movidetails imageURLArray] objectAtIndex:2] objectForKey:@"label"];
    NSData *data=[NSData dataWithContentsOfFile:[[obj savedDataDictionary] objectForKey:url]];
    [self.movieIcon setImage:[UIImage imageWithData:data]];
}

-(void)viewDidLayoutSubviews {
    [self.movieSummery scrollRangeToVisible:NSMakeRange(0, 0)];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
