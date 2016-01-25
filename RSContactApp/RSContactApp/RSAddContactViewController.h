//
//  RSAddContactViewController.h
//  RSContactApp
//
//  Created by Santosh Kumar Sahoo on 14/12/15.
//  Copyright © 2015 Robosoft Technologies. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RSContactListTableViewController.h"
#import "RSContactDetails.h"

@interface RSAddContactViewController : UIViewController<UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *firstNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *lastNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *designationTextField;
@property (weak, nonatomic) IBOutlet UITextField *companyTextField;
@property (weak, nonatomic) IBOutlet UITextField *contactNumberTextField;
@property (weak, nonatomic) IBOutlet UITextField *emailTextField;

- (IBAction)didTapAddContact:(UIBarButtonItem *)sender;

@end
