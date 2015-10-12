//
//  main.m
//  Topic
//
//  Created by ultra on 10/8/15.
//  Copyright © 2015 ultra. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Topic.h"
#import "Author.h"
#import "MyComment.h"

int idNumber;
NSString *content;
NSString *output;
NSMutableArray *topics;
NSMutableArray *comments;

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        idNumber = 1;
        content = @"hahaha";
        Author  *author = [[Author alloc] initWithId:1 firstName: @"BanZhao" lastName:@"Huang" profileImage: @"null"];
        MyComment *comment1 = [[MyComment alloc] initWithId:1 Content:@"call me comment1" Author: author ];
        NSLog(@"%@",comment1.getAuthor.getFirstName);
        
        MyComment *comment2 = [[MyComment alloc] initWithId:2 Content:@"call me comment2" Author: author];
        
        comments = [[NSMutableArray alloc]initWithCapacity:40];
        [comments addObject:comment1];
        [comments addObject:comment2];
        
        Topic *topic1 = [[Topic alloc] initWithId:1 Title:@"WTF Moments" Content:@"This is wtf moment!" Tag:@"Dota2" Author:author Comments: comments];
        
        NSMutableArray *coms = topic1.getComments;
        for (MyComment *com in coms)
        NSLog(@"%@",com.getContent);
    
        
       // topics = [[NSMutableArray alloc] initWithCapacity:40];
       // [topics addObject:topic];
        
      //  for (Topic *topic in topics){
      //      output = topic.getContent;
    //        NSLog(@"字符串:%@",output);
    //    }
        
    }
    return 0;
}
