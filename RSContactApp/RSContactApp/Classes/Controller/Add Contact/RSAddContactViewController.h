//
//  RSAddContactViewController.h
//  RSContactApp
//
//  Created by Santosh Kumar Sahoo on 14/12/15.
//  Copyright © 2015 Robosoft Technologies. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RSAddContactViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *firstNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *lastNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *designationTextField;
@property (weak, nonatomic) IBOutlet UITextField *companyTextField;
- (IBAction)uploadContactImage:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UITextField *contactNumberTextField;
@property (weak, nonatomic) IBOutlet UITextField *emailTextField;
@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;
- (IBAction)didTapAddContact:(UIBarButtonItem *)sender;
@end
