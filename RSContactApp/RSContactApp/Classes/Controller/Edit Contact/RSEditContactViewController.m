//
//  RSEditContactViewController.m
//  RSContactApp
//
//  Created by Santosh Kumar Sahoo on 15/12/15.
//  Copyright © 2015 Robosoft Technologies. All rights reserved.
//

#import "RSEditContactViewController.h"

/*
 This Class is dealing with updation of a contact
 **/

@implementation RSEditContactViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setDelegateToTextField];
    UITapGestureRecognizer * tapGesture = [[UITapGestureRecognizer alloc]
                                           initWithTarget:self
                                           action:@selector(hideKeyBoard)];
    [self.view addGestureRecognizer:tapGesture];
    _designationTextField.text = _contact.designation;
    _firstNameTextField.text = _contact.fname;
    _lastNameTextField.text = _contact.lname;
    _companyTextField.text = _contact.company;
    _mobileNumberTextField.text = [_contact.mobileNo stringValue];
}

#pragma mark - UitextField Delegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}
/**
 @Brief : convenience method to Update the contact details of the existing contact when user tap on DONE button after editing the contact
 @param : UIBarButtonItem instance of the tapped button
 */

- (IBAction)didTapDone:(UIBarButtonItem *)sender {
    if([_firstNameTextField.text isEqualToString:@""]) {    //Whether 1st name is nil or not
        NSString *message=@"First Name Can't be NULL";
        NSString *title=@"Opps";
        [self showAlert:title message:message];
    } else if ((([_contact.fname isEqualToString:_firstNameTextField.text] &&
                 [_contact.lname isEqualToString:_lastNameTextField.text]) &&
                [_contact.designation isEqualToString:_designationTextField.text] &&
                [_contact.company isEqualToString:_companyTextField.text]) &&
               [_contact.mobileNo isEqualToNumber:[NSNumber numberWithLongLong:[_mobileNumberTextField.text longLongValue]]]) {    //Check whether the user is updating somthing or not
        NSString *message = @"You are not updating anything";
        NSString *title = @"Opps";
        [self showAlert:title  message:message];
    } else {    // updation Task performed
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            self.contact.fname = _firstNameTextField.text;
            self.contact.lname = _lastNameTextField.text;
            self.contact.company = _companyTextField.text;
            self.contact.designation = _designationTextField.text;
            RSManageCoreData *manageObject = [RSManageCoreData sharedInstance];
            [manageObject doUpdation:_contact];
            dispatch_async(dispatch_get_main_queue(), ^{
                NSString *message = @"Successfully Updated";
                NSString *title = @"Contact";
                [self showAlert:title message:message];
            });
        });
    }
}
/**
 @Brief : convenience method to Upload photo
 @param : UIButton instance of the tapped button
 */

- (IBAction)didTapAddPhoto:(UIButton *)sender {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Take Photo" message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction *choose = [UIAlertAction actionWithTitle:@"Choose Photo" style:UIAlertActionStyleDefault handler:^(UIAlertAction *  action) {
        // Implementation for storing Image
    }];
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction *  action) {
        
    }];
    [alert addAction:choose];
    [alert addAction:cancel];
    [self presentViewController:alert animated:YES completion:nil];
}

#pragma mark - utility Method

/**
 @Brief : convenience method to set delegate to the text field objects
 */

-(void) setDelegateToTextField {
    _firstNameTextField.delegate = self;
    _lastNameTextField.delegate = self;
    _designationTextField.delegate = self;
    _companyTextField.delegate = self;
    _mobileNumberTextField.delegate = self;
}
/**
 @Brief : convenience method to hide the Keyboard when user tap on the view other than text field
 */

- (void) hideKeyBoard {
    [self.view endEditing:YES];
}
/**
 @Brief : convenience method to show the alert message
 @param : title as string for alert title and message as a string for alert message
 */

-(void)showAlert:(NSString *)title message:(NSString *)message {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {
    }];
    [alert addAction:defaultAction];
    [self presentViewController:alert animated:YES completion:nil];
}

@end
