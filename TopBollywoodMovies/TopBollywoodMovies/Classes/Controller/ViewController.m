//
//  ViewController.m
//  TopBollywoodMovies
//
//  Created by Santosh Kumar Sahoo on 04/01/16.
//  Copyright © 2016 Robosoft Technologies. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self doParseWithURL];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - TableViewDataSource Method
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _moviesArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TBMovieTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"cellForMovie"];
    [cell configureCellWithData:[_moviesArray objectAtIndex:indexPath.row]];
    cell.count.text = [NSString stringWithFormat:@"%ld", [indexPath row]+1];
    return cell;
}
#pragma mark - TableViewDelegate Method
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 115;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    TBMovieSummeryViewController *obj=[[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"DetailPage"];
    obj.movidetails=[_moviesArray objectAtIndex:indexPath.row];
    [self.navigationController pushViewController:obj animated:YES];
}
#pragma mark - TBURLParsingDelegate methods
/**
 @brief : executed when data Parse successfully in TBPerformOperation
 @param : array of NSArray type is contains the Movie list in the form of movidetails object
 */
- (void) didParseSuccessfully:(NSArray *)array {
    self.moviesArray=array;
    [self.tableView reloadData];
}
/**
 @brief : This method is executed when data parsing failed
 @param : Takes NSError as parameter
 */
- (void) didParseFailed : (NSError *)error {
    NSLog(@"Error : %@ ",error);
}
#pragma mark - utility Method
/**
 @brief : This method is responsible to call TBNetworkManager class method for parsing the data in secondary thread
 */
- (void) doParseWithURL {
    NSString * moviesURL=@"https://itunes.apple.com/in/rss/topmovies/limit=50/genre=4431/json";
    TBNetworkManager *obj=[TBNetworkManager sharedInstance];
    [obj doParsingDataWithUrl:moviesURL forDelegate:self];
}
@end
