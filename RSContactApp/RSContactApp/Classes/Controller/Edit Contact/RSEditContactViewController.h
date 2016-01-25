//
//  RSEditContactViewController.h
//  RSContactApp
//
//  Created by Santosh Kumar Sahoo on 15/12/15.
//  Copyright © 2015 Robosoft Technologies. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RSContactDetails.h"
#import "RSManageCoreData.h"

@interface RSEditContactViewController : UIViewController<UITextFieldDelegate>

@property (strong, nonatomic) RSContactDetails *contact;
@property (weak, nonatomic) IBOutlet UITextField *firstNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *lastNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *designationTextField;
@property (weak, nonatomic) IBOutlet UITextField *companyTextField;
@property (weak, nonatomic) IBOutlet UITextField *mobileNumberTextField;

- (IBAction)didTapDone:(UIBarButtonItem *)sender;
- (IBAction)didTapAddPhoto:(UIButton *)sender;

@end
