//
//  RSAddContactViewController.m
//  RSContactApp
//
//  Created by Santosh Kumar Sahoo on 14/12/15.
//  Copyright © 2015 Robosoft Technologies. All rights reserved.
//

#import "RSAddContactViewController.h"
#import "AppDelegate.h"
#import "ContactDetails.h"
#import "ContactDetails+CoreDataProperties.h"
#import "RSAllContactViewController.h"
@interface RSAddContactViewController ()<UITextFieldDelegate>

@end

@implementation RSAddContactViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    AppDelegate *appdelegate =[[UIApplication sharedApplication]delegate];
    
    _managedObjectContext = [appdelegate managedObjectContext];
    UITapGestureRecognizer * tapGesture = [[UITapGestureRecognizer alloc]
                                           initWithTarget:self
                                           action:@selector(hideKeyBoard)];
    
    [self.view addGestureRecognizer:tapGesture];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)hideKeyBoard {
    [self.view endEditing:YES];
}
- (IBAction)uploadContactImage:(UIButton *)sender {
}

- (IBAction)didTapAddContact:(UIBarButtonItem *)sender {
    ContactDetails *contactDetails = [NSEntityDescription insertNewObjectForEntityForName:@"ContactDetails" inManagedObjectContext:_managedObjectContext];
    
    //contactDetails.email = self.emailTextField.text;
    //contactDetails.orgnization =self.orgnizationTextField.text;
    
    NSError *error = nil;
    
    
    if ([self.firstNameTextField.text isEqualToString:@""]) {
        NSString *title=@"Sorry";
        NSString *message=@"first Name should not be Null";
        [self showAlert:title message:message];
    }
    else if ([self.contactNumberTextField.text length] !=10) {
        NSString *title=@"Sorry";
        NSString *message=@"Contact Number Should be 10 digit";
        [self showAlert:title message:message];
    }
    else {
        [contactDetails setFirstName:self.firstNameTextField.text];
        contactDetails.lastName =self.lastNameTextField.text;
        contactDetails.designation =self.designationTextField.text;
        contactDetails.company=self.companyTextField.text;
        contactDetails.email = self.emailTextField.text;
        contactDetails.mobileNumber=[NSNumber numberWithLongLong:[self.contactNumberTextField.text longLongValue]];
        NSString *title=@"Done";
        NSString *message=@"Contact Successfully Added";
        if (![_managedObjectContext save :&error]) {
            
            // handle error here
            NSLog(@"hi");
        }
        self.firstNameTextField.text=nil;
        self.lastNameTextField.text=nil;
        self.companyTextField.text=nil;
        self.designationTextField.text=nil;
        self.contactNumberTextField.text=nil;
        self.emailTextField.text=nil;
        [self showAlert:title message:message];
    }
    

    
    
    
}
-(void)showAlert:(NSString *)title message:(NSString *)message {
    UIAlertController *alert=[UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {}];
    [alert addAction:defaultAction];
    [self presentViewController:alert animated:YES completion:nil];
}
@end
