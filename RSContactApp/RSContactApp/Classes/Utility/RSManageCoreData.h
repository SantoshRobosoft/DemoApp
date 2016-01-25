//
//  RSManageCoreData.h
//  RSContactApp
//
//  Created by Santosh Kumar Sahoo on 12/01/16.
//  Copyright © 2016 Robosoft Technologies. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AppDelegate.h"
#import "ContactDetails+CoreDataProperties.h"
#import "ContactDetails.h"
#import "RSContactDetails.h"

@interface RSManageCoreData : NSObject

+ (instancetype)sharedInstance;
- (void)doAddContact:(RSContactDetails *)contact;
- (void)doUpdation:(RSContactDetails *)contact;
-(void)doDelete:(RSContactDetails *)contact;
- (void)doParseWithHandler:(void(^)(NSArray *,NSError *))handler;

@end
