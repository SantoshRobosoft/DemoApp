//
//  RSContactDetails.h
//  RSContactApp
//
//  Created by Santosh Kumar Sahoo on 12/01/16.
//  Copyright © 2016 Robosoft Technologies. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ContactDetails.h"

@interface RSContactDetails : NSObject

@property(strong,nonatomic) NSString *fname;
@property(strong,nonatomic) NSString *lname;
@property(strong,nonatomic) NSString *designation;
@property(strong,nonatomic) NSString *company;
@property(strong,nonatomic) NSString *email;
@property(strong,nonatomic) NSNumber *mobileNo;

- (instancetype) initWithData :(ContactDetails *)contcatDetails;

@end
