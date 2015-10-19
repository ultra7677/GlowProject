//
//  Topic.h
//  Topic
//
//  Created by ultra on 10/8/15.
//  Copyright © 2015 ultra. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Author.h"
#import "MyComment.h"

@interface Topic : NSObject{
    NSString *content;
    NSString *title;
    NSString *tag;
    NSString *TimeCreated;
    // comments is a object array of Comment Class
    NSMutableArray *comments;
    
    //Author is a object of Author Class
    Author *author;
    
    int idNumber;
    int commentsNumber;
    int views;
}

- (id) initWithId:(int)_idNumber
       Title:(NSString*)_title
       Content:(NSString*)_content
       Tag:(NSString*)_tag
       Author:(Author*)_author
       Comments:(NSMutableArray*)_comments;

-(NSString*)getContent;
-(NSString*)getTitle;
-(NSString*)getTag;
-(NSMutableArray*)getComments;

-(Author*)getAuthor;

- (int) getIdNumber;
- (int) getCommentsNumber;

-(void)setCommentsNumber:(int)_number;

@end