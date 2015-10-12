//
//  Comment.m
//  Topic
//
//  Created by ultra on 10/9/15.
//  Copyright © 2015 ultra. All rights reserved.
//
#import "MyComment.h"

@implementation MyComment

-(id) initWithId:(int)_idNumber
       Content:(NSString*)_content
       Author:(Author*)_author
    {
    
    if (self = [super init]){
        idNumber = _idNumber;
        content  = _content;
        author = _author;
    }
    return self;
}

-(int) getIdNumber{
    return self->idNumber;
}

-(NSString*)getContent{
    return self->content;
}

-(Author*)getAuthor{
    return self->author;
}
@end