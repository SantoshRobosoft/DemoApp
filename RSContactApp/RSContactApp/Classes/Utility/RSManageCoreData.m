//
//  RSManageCoreData.m
//  RSContactApp
//
//  Created by Santosh Kumar Sahoo on 12/01/16.
//  Copyright © 2016 Robosoft Technologies. All rights reserved.
//

#import "RSManageCoreData.h"
/**
    This Class is responsible to manipulate the Core Data
 */

@interface RSManageCoreData()

@property(strong,nonatomic) NSMutableArray *ContctDetailsArrary;
@property(strong,nonatomic) NSArray *arrayForUpdation;
@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

@end

@implementation RSManageCoreData

+ (instancetype)sharedInstance {
    static dispatch_once_t once;
    static RSManageCoreData *sharedInstance;
    dispatch_once(&once, ^{
        sharedInstance = [RSManageCoreData new];
        sharedInstance.ContctDetailsArrary = [[NSMutableArray alloc]init];
    });
    return sharedInstance;
}
/**
 @Brief : Convenience method to Fetch Data from CoreData
 @param : handler as a Block having NSArray,NSError as parameters
 */

- (void)doParseWithHandler : (void(^)(NSArray *,NSError *))handler{
    dispatch_queue_t operationQueue;
    operationQueue = dispatch_queue_create("operationQueue", nil);
    dispatch_async(operationQueue, ^{
        NSFetchRequest *request = [[NSFetchRequest alloc] init];
        AppDelegate *appdelegate = [[UIApplication sharedApplication] delegate];
        _managedObjectContext = [appdelegate managedObjectContext];
        NSEntityDescription *entityDescription = [NSEntityDescription entityForName:@"ContactDetails" inManagedObjectContext:_managedObjectContext];
        [request setEntity:entityDescription];
        NSSortDescriptor *descriptor = [NSSortDescriptor sortDescriptorWithKey:@"firstName" ascending:YES];
        NSArray *descriptors = [[NSArray alloc]initWithObjects:descriptor, nil];
        [request setSortDescriptors:descriptors];
        NSError *error = nil;
        NSArray *array = [[_managedObjectContext executeFetchRequest:request error:&error] mutableCopy];
        _arrayForUpdation = nil;
        [self setArrayForUpdation:array]; // This array requires at the time of Updation
        if (error) {
            dispatch_async(dispatch_get_main_queue(), ^{
                handler(_ContctDetailsArrary,error);
            });
        } else {
            if ([array isKindOfClass:[NSArray class]]) {
                [_ContctDetailsArrary removeAllObjects];
                for (ContactDetails *data in array) {
                    if ([data isKindOfClass:[ContactDetails class]]) {
                        RSContactDetails *contactDetails = [[RSContactDetails alloc]initWithData:data];
                        [self.ContctDetailsArrary addObject:contactDetails];
                    }
                }
                dispatch_async(dispatch_get_main_queue(), ^{
                    handler(_ContctDetailsArrary,error);
                });
            }
        }
    });
}
/**
 @Brief : Convenience method to update the edited contact details to CoreData
 @param : contact is of RSContactDetails type which contain the details about a single contact
 */

- (void)doUpdation:(RSContactDetails *)contact {
    
    NSInteger i = [_ContctDetailsArrary indexOfObject:contact];
    if (i>=0) {
        ContactDetails * contactDetails = [_arrayForUpdation objectAtIndex:i];
        [self doSetDataToCoreData:contactDetails From:contact];
        
    } else {
        NSLog(@"some thing goes wrong in Updation !!");
    }
}
/**
 @Brief : Convenience method to add a new contact to CoreData
 @param : contact is of RSContactDetails type which contain the details about a single contact
 */

- (void)doAddContact:(RSContactDetails *)contact {
    ContactDetails *contactDetails = [NSEntityDescription insertNewObjectForEntityForName:@"ContactDetails" inManagedObjectContext:_managedObjectContext];
    [self doSetDataToCoreData:contactDetails From:contact];
}
/**
 @Brief : Convenience method to set the updated or new data to CoreData entity elements
 @param : a instance of ContactDetails and  contact is of RSContactDetails type which contain the details about a single contact
 */

- (void)doSetDataToCoreData:(ContactDetails *)contactDetails From:(RSContactDetails *)contact {
    NSError *error = nil;
    contactDetails.firstName = contact.fname;
    contactDetails.lastName = contact.lname;
    contactDetails.designation = contact.designation;
    contactDetails.mobileNumber = contact.mobileNo;
    contactDetails.company = contact.company;
    contactDetails.email = contact.email;
    if (![_managedObjectContext save:&error]) {
        NSLog(@"Can't Save! %@ %@", error, [error localizedDescription]);
    }
}
/**
 @Brief : Convenience method to delete a contact from CoreData
 @param : contact is of RSContactDetails type which contain the details about a single contact which is going to be delete
 */

- (void)doDelete:(RSContactDetails *)contact {
    NSInteger i = [_ContctDetailsArrary indexOfObject:contact];
    if (i>=0) {
        [_managedObjectContext deleteObject:[_arrayForUpdation objectAtIndex:i]];
        
    } else {
        NSLog(@"some thing goes wrong");
    }
    NSError *error = nil;
    if (![_managedObjectContext save:&error]) {
        NSLog(@"Can't Delete! %@ %@", error, [error localizedDescription]);
        //return ;
    }
}

@end
