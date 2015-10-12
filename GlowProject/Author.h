//
//  Author.h
//  Topic
//
//  Created by ultra on 10/9/15.
//  Copyright © 2015 ultra. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Author : NSObject{
    int idNumber;
    
    NSString *firstName;
    NSString *lastName;
    UIImage *profileImage;
    
}
- (id) initWithId:(int)_idNumber
       firstName:(NSString*)_firstName
       lastName:(NSString*)_lastName
     profileImage:(UIImage*)_profileImage;

- (int) getIdNumber;

- (NSString*) getFirstName;
- (NSString*) getLastName;
- (UIImage*) getProfileImage;

@end