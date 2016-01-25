//
//  TBURLParsingDelegate.h
//  TopBollywoodMovies
//
//  Created by Santosh Kumar Sahoo on 04/01/16.
//  Copyright © 2016 Robosoft Technologies. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol TBURLParsingDelegate <NSObject>
@required
- (void) didParseSuccessfully:(NSArray *)array;
- (void) didParseFailed : (NSError *)error;
@end
