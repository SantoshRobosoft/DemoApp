//
//  RSContactListTableViewController.h
//  RSContactApp
//
//  Created by Santosh Kumar Sahoo on 12/01/16.
//  Copyright © 2016 Robosoft Technologies. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ContactDetails.h"
#import "RSDisplayContactDetailViewController.h"

@interface RSContactListTableViewController : UITableViewController<UISearchBarDelegate>

@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;

@end
