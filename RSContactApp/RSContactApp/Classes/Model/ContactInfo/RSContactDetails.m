//
//  RSContactDetails.m
//  RSContactApp
//
//  Created by Santosh Kumar Sahoo on 12/01/16.
//  Copyright © 2016 Robosoft Technologies. All rights reserved.
//

#import "RSContactDetails.h"

/*
@Brief : Convenience ModelClass to store contact Details
 **/

@implementation RSContactDetails

- (instancetype) initWithData :(ContactDetails *)contcatDetails {
    if(self = [super init]) {
        self.designation = contcatDetails.designation;
        self.fname = contcatDetails.firstName;
        self.lname = contcatDetails.lastName;
        self.company = contcatDetails.company;
        self.email = contcatDetails.email;
        self.mobileNo = contcatDetails.mobileNumber;
    }
    return self;
}

@end
