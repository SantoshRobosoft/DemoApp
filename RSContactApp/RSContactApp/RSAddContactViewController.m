//
//  RSAddContactViewController.m
//  RSContactApp
//
//  Created by Santosh Kumar Sahoo on 14/12/15.
//  Copyright © 2015 Robosoft Technologies. All rights reserved.
//

#import "RSAddContactViewController.h"
/*
 This class is responsible for adding a new contact
 **/
@implementation RSAddContactViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UITapGestureRecognizer * tapGesture = [[UITapGestureRecognizer alloc]
                                           initWithTarget:self
                                           action:@selector(hideKeyBoard)];
    [self.view addGestureRecognizer:tapGesture];
}
/**
 @Brief : convenience method to hide the Keyboard when user tap on the view other than text field
 */

-(void)hideKeyBoard {
    [self.view endEditing:YES];
}
/**
 @Brief : convenience method to Add contact
 @param : UIBarButtonItem instance of the tapped button
 */

- (IBAction)didTapAddContact:(UIBarButtonItem *)sender {
    RSContactDetails *contact=[[RSContactDetails alloc]init];
    //First Name should not be null
    if ([self.firstNameTextField.text isEqualToString:@""]) {
        NSString *title = @"Sorry";
        NSString *message = @"first Name should not be Null";
        [self showAlert:title message:message];
    } else if ([self.contactNumberTextField.text length] !=10) {
        NSString *title = @"Sorry";
        NSString *message = @"Contact Number Should be 10 digit";
        [self showAlert:title message:message];
    } else {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            contact.fname = _firstNameTextField.text;
            contact.lname = _lastNameTextField.text;
            contact.designation = _designationTextField.text;
            contact.company = _companyTextField.text;
            contact.email = _emailTextField.text;
            contact.mobileNo = [NSNumber numberWithLongLong:[self.contactNumberTextField.text longLongValue]];
            [[RSManageCoreData sharedInstance] doAddContact:contact];
            NSString *title = @"Done";
            NSString *message = @"Contact Successfully Added";
            dispatch_async(dispatch_get_main_queue(), ^{
                self.firstNameTextField.text = nil;
                self.lastNameTextField.text = nil;
                self.companyTextField.text = nil;
                self.designationTextField.text = nil;
                self.contactNumberTextField.text = nil;
                self.emailTextField.text = nil;
                [self showAlert:title message:message];
            });
        });
    }
}
/**
 @Brief : convenience method to show the alert message
 @param : title as string for alert title and message as a string for alert message
 */

-(void)showAlert:(NSString *)title message:(NSString *)message {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {}];
    [alert addAction:defaultAction];
    [self presentViewController:alert animated:YES completion:nil];
}

@end
