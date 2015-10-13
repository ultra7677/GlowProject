//
//  Author.m
//  Topic
//
//  Created by ultra on 10/9/15.
//  Copyright © 2015 ultra. All rights reserved.
//

#import "Author.h"

@implementation Author

-(id) initWithId:(int)_idNumber
      firstName:(NSString*)_firstName
      lastName:(NSString*)_lastName
      profileImage:(UIImageView*)_profileImage{
    
    if (self = [super init]){
        idNumber = _idNumber;
        firstName = _firstName;
        lastName  = _lastName;
        profileImage = _profileImage;
    }
    return self;
}

-(int) getIdNumber{
    return self->idNumber;
}

-(NSString*) getFirstName{
    return self->firstName;
}

-(NSString*) getLastName{
    return self->lastName;
}

-(UIImageView*) getProfileImage{
    return self->profileImage;
}

@end