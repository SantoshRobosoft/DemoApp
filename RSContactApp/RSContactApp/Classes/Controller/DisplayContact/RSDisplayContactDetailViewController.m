//
//  RSDisplayContactDetailViewController.m
//  RSContactApp
//
//  Created by Santosh Kumar Sahoo on 15/12/15.
//  Copyright © 2015 Robosoft Technologies. All rights reserved.
//

#import "RSDisplayContactDetailViewController.h"

/*
 Convenience Class to Display details of a Contact
 **/

@implementation RSDisplayContactDetailViewController

-(void)viewWillAppear:(BOOL)animated {
    _nameLabel.text = [_contact.fname stringByAppendingFormat:@" %@",_contact.lname];
    _companyLabel.text = _contact.company;
    _designationLabel.text = _contact.designation;
    _emailTextField.text = _contact.email;
    _mobileNumberTextField.text = [_contact.mobileNo stringValue];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"pushToEdit"]) {
        RSEditContactViewController *destViewController = segue.destinationViewController;
        destViewController.contact = _contact;
    }
}

@end
