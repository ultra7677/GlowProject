//
//  Comment.h
//  Topic
//
//  Created by ultra on 10/9/15.
//  Copyright © 2015 ultra. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Author.h"

@interface MyComment : NSObject{
    NSString *content;
    NSString *timeCreated;
    
    //Author is a object of Author Class
    Author *author;
    
    int idNumber;
}

    - (id) initWithId:(int)_idNumber
           Content:(NSString*)_content
           Author:(Author*)_author;
    
    - (Author*) getAuthor;
    - (NSString*) getContent;
    - (int) getIdNumber;
@end