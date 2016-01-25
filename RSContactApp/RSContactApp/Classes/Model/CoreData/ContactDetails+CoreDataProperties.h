//
//  ContactDetails+CoreDataProperties.h
//  RSContactApp
//
//  Created by Santosh Kumar Sahoo on 12/01/16.
//  Copyright © 2016 Robosoft Technologies. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "ContactDetails.h"

NS_ASSUME_NONNULL_BEGIN

@interface ContactDetails (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *company;
@property (nullable, nonatomic, retain) NSString *designation;
@property (nullable, nonatomic, retain) NSString *email;
@property (nullable, nonatomic, retain) NSString *firstName;
@property (nullable, nonatomic, retain) NSData *image;
@property (nullable, nonatomic, retain) NSString *lastName;
@property (nullable, nonatomic, retain) NSNumber *mobileNumber;

@end

NS_ASSUME_NONNULL_END
