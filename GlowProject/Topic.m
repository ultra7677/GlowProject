//
//  Topic.m
//  passingObject
//
//  Created by ultra on 10/8/15.
//  Copyright © 2015 ultra. All rights reserved.
//
#import "Topic.h"

@implementation Topic

-(id) initWithId:(int)_idNumber
           Title:(NSString*)_title
      Content:(NSString*)_content
             Tag:(NSString*)_tag
          Author:(Author*)_author
        Comments:(NSMutableArray*)_comments
      {
    if (self = [super init]){
        idNumber = _idNumber;
        title = _title;
        content  = _content;
        tag = _tag;
        author = _author;
        comments = _comments;
    }
    return self;
}

-(NSString*)getContent{
    return self->content;
}

-(NSString*)getTitle{
    return self->title;
}

-(NSString*)getTag{
    return self->tag;
}

-(Author*)getAuthor{
    return self->author;
}

-(NSMutableArray*)getComments{
    return self->comments;
}

-(int)getIdNumber{
    return self->idNumber;
}

-(int)getCommentsNumber{
    return self->commentsNumber;
}

-(void)setCommentsNumber:(int) _number{
    commentsNumber = _number;
}

    
@end