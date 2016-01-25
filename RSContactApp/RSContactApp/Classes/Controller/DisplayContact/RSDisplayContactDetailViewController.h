//
//  RSDisplayContactDetailViewController.h
//  RSContactApp
//
//  Created by Santosh Kumar Sahoo on 15/12/15.
//  Copyright © 2015 Robosoft Technologies. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import "ContactDetails.h"
//#import "ContactDetails+CoreDataProperties.h"
#import "RSContactDetails.h"
#import "RSEditContactViewController.h"

@interface RSDisplayContactDetailViewController : UIViewController

@property (strong, nonatomic) RSContactDetails *contact;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *designationLabel;
@property (weak, nonatomic) IBOutlet UILabel *companyLabel;
@property (weak, nonatomic) IBOutlet UILabel *mobileNumberTextField;
@property (weak, nonatomic) IBOutlet UILabel *emailTextField;

@end
