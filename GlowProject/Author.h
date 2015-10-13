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
    UIImageView *profileImage;
    
}
- (id) initWithId:(int)_idNumber
       firstName:(NSString*)_firstName
       lastName:(NSString*)_lastName
     profileImage:(UIImageView*)_profileImage;

- (int) getIdNumber;

- (NSString*) getFirstName;
- (NSString*) getLastName;
- (UIImageView*) getProfileImage;

@end