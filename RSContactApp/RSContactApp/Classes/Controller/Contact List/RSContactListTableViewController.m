//
//  RSContactListTableViewController.m
//  RSContactApp
//
//  Created by Santosh Kumar Sahoo on 12/01/16.
//  Copyright © 2016 Robosoft Technologies. All rights reserved.
//

#import "RSContactListTableViewController.h"

/*
 @Brief : Convenience Class to display all the contacts
 **/

@interface RSContactListTableViewController ()

@property (strong, nonatomic) RSContactDetails *contact;
@property (strong, nonatomic) NSArray *rsContactDetailsObjectArray;
@property (strong, nonatomic) NSMutableDictionary *indexForContact;
@property (strong, nonatomic) NSMutableDictionary *sectionDic;
@property (assign, nonatomic) BOOL isFiltered;
@property (strong, nonatomic) NSMutableArray *searchResults;
@property (strong, nonatomic) RSManageCoreData *manageCoreData;
@end

@implementation RSContactListTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.indexForContact = [[NSMutableDictionary alloc]init];
    self.sectionDic = [[NSMutableDictionary alloc]init];
    self.searchResults = [[NSMutableArray alloc]init];
    self.manageCoreData = [RSManageCoreData sharedInstance];
}

- (void) viewWillAppear:(BOOL)animated {
    [self allContact];
}

#pragma mark - <TableViewDataSource>

- (nullable NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    if (_isFiltered) {
        return @"Search Result";
    } else {
        return [[[_sectionDic allKeys] sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)] objectAtIndex:section];
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    if (_isFiltered) {
        return 1;
    } else {
        return [[_sectionDic allKeys]count];
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (_isFiltered) {
        return [_searchResults count];
    } else {
        return [[_sectionDic valueForKey:[[[_sectionDic allKeys] sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)] objectAtIndex:section]] count];
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellForConact" forIndexPath:indexPath];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cellForContact"];
    }
    NSString *titleText;
    if (_isFiltered) {
        titleText=[_searchResults objectAtIndex:indexPath.row];
    } else {
        titleText = [[_sectionDic valueForKey:[[[_sectionDic allKeys] sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)] objectAtIndex:indexPath.section]] objectAtIndex:indexPath.row];
    }
    cell.textLabel.text = titleText;
    [cell.imageView setImage:[UIImage imageNamed:@"contact2.png"]];
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        NSNumber *index = [_indexForContact objectForKey:[[_sectionDic valueForKey:[[[_sectionDic allKeys] sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)] objectAtIndex:indexPath.section]] objectAtIndex:indexPath.row]];
        self.contact = [_rsContactDetailsObjectArray objectAtIndex:[index intValue]];
        [_manageCoreData doDelete:_contact];
        [self allContact];
    }
}

#pragma mark - utility method

/*
 @Brief : convenience method to fetch and parse the data from Core Data
 **/

- (void) allContact {
    [_manageCoreData doParseWithHandler:^(NSArray *ContactList,NSError *error) {
        if(!error) {
            self.rsContactDetailsObjectArray = nil;
            self.rsContactDetailsObjectArray = ContactList;
            [self doSortData];
            [self.tableView reloadData];
        } else {
            NSLog(@"Error : %@",[error description]);
        }
    }];
}

/**
 @Brief : Convenince  method to sort the contact to show in the table view
 */

- (void) doSortData {
    NSMutableArray *sortedContactArray = [[NSMutableArray alloc]init];
    [_indexForContact removeAllObjects];
    [_sectionDic removeAllObjects];
    BOOL found;
    int i;
    for(i=0;i<_rsContactDetailsObjectArray.count;i++) {
        self.contact = [_rsContactDetailsObjectArray objectAtIndex:i];
        if ([_contact.fname isEqualToString:@""] || _contact.fname == nil ) {
            NSLog(@"Name is nil..");
        } else {
            NSString *fullname=[_contact.fname stringByAppendingFormat:@" %@",_contact.lname];
            [sortedContactArray addObject:fullname];
            [self.indexForContact setObject:[NSNumber numberWithInt:i] forKey:fullname];
        }
    }
    for (NSString *temp in sortedContactArray) {
        NSString *firstCharacter = [temp substringToIndex:1];
        found = NO;
        NSString *name = [firstCharacter uppercaseString];
        for (NSString *str in [_sectionDic allKeys]) {
            if ([str  isEqualToString:firstCharacter]||[str  isEqualToString:name]) {
                found = YES;
                break;
            }
        }
        if (!found) {
            //creating a dictionary where key is alphabate (1st character of name) and values is array of name .ex:-  S : santosh,Sam,siddu
            [_sectionDic setValue:[[NSMutableArray alloc] init] forKey:name];
        }
    }
    for (NSString *temp in sortedContactArray) {
        [[_sectionDic objectForKey:[[temp substringToIndex:1]uppercaseString]] addObject:temp];
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"pushOperation"]) {
        RSDisplayContactDetailViewController *destViewController = segue.destinationViewController;
        NSIndexPath *indexPath = nil;
        NSString *name;
        indexPath = [self.tableView indexPathForSelectedRow];
        if (_isFiltered) {
            name=[_searchResults objectAtIndex:indexPath.row];
        } else {
            name=[[_sectionDic valueForKey:[[[_sectionDic allKeys] sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)] objectAtIndex:indexPath.section]] objectAtIndex:indexPath.row];
        }
        NSNumber *num=[_indexForContact objectForKey:name];
        destViewController.contact=[_rsContactDetailsObjectArray objectAtIndex:[num intValue]];
    }
}

#pragma mark - UISearchBArDelegate method

-(void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText {
    if (searchText.length ==0) {
        _isFiltered=NO;
    } else {
        _isFiltered=YES;
        if (_searchResults) {
            [_searchResults removeAllObjects];
        } else {
            _searchResults=[[NSMutableArray alloc]init];
        }
        for (RSContactDetails *contact in _rsContactDetailsObjectArray) {
            NSRange r=[[contact.fname stringByAppendingString:contact.lname]  rangeOfString:searchText options:NSCaseInsensitiveSearch];
            if (r.location !=NSNotFound) {
                [_searchResults addObject:[contact.fname stringByAppendingFormat:@" %@",contact.lname]];
            }
        }
    }
    [self.tableView reloadData];
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    [_searchBar resignFirstResponder];
}

@end
