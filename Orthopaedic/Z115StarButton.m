//
//  Z115StarButton.m
//  Orthopaedic
//
//  Created by TienT on 11/29/13.
//  Copyright (c) 2013 TienT. All rights reserved.
//

#import "Z115StarButton.h"
#import "Z115WordPressPost.h"
#import "Z115WordPressPostAuthor.h"
#import "Z115Post.h"

@implementation Z115StarButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self switchOff];

    }
    return self;
}

- (BOOL)switchStar
{
    BOOL flag = YES;
    if ([self.currentBackgroundImage isEqual:[UIImage imageNamed:@"star1.png"]]) {
        [self setBackgroundImage:[UIImage imageNamed:@"star2.png"] forState:UIControlStateNormal];
        flag = YES;
    } else {
        [self setBackgroundImage:[UIImage imageNamed:@"star1.png"] forState:UIControlStateNormal];
        flag = NO;
    }
    
    //NSLog(@"switched");
    
    return flag;
}

- (void)switchOn
{
    [self setBackgroundImage:[UIImage imageNamed:@"star2.png"] forState:UIControlStateNormal];
    //NSLog(@"switch On");
}

- (void)switchOff
{
    [self setBackgroundImage:[UIImage imageNamed:@"star1.png"] forState:UIControlStateNormal];
    //NSLog(@"switch Off");
}


- (void)savePost:(Z115WordPressPost *)post
{
    // Save Managed Object Context
    Z115Post *coreDataPost = [Z115Post findFirstByAttribute:@"z115WordPressPostId" withValue:post.z115WordPressPostId];
    
    if(coreDataPost == nil) {
        
        Z115Post *z115Post = [Z115Post createEntity];
        z115Post.z115WordPressPostId = post.z115WordPressPostId;
        z115Post.author = post.author.name;
        z115Post.content = post.content;
        z115Post.excerpt = post.excerpt;
        z115Post.modified = post.modified;
        z115Post.postDate = post.postDate;
        z115Post.postHtml = post.postHtml;
        z115Post.slug = post.slug;
        z115Post.status = post.status;
        z115Post.thumbnail = post.thumbnail;
        z115Post.title = post.title;
        z115Post.titlePlain = post.titlePlain;
        
        [[NSManagedObjectContext defaultContext] saveToPersistentStoreAndWait];
        NSLog(@"Saved");
    }
    
    
    
    //NSArray *posts = [Z115Post MR_findAll];
    //NSLog(@"CORE DATA POSTS LIST =  \n %@",posts);
    
}

- (void)deletePost:(Z115WordPressPost *)post
{
    Z115Post *z115Post = [Z115Post findFirstByAttribute:@"z115WordPressPostId" withValue:post.z115WordPressPostId];
    [z115Post deleteEntity];
    [[NSManagedObjectContext defaultContext] saveToPersistentStoreAndWait];
    NSLog(@"Deleted");
    
    //NSArray *posts = [Z115Post MR_findAll];
    //NSLog(@"CORE DATA POSTS LIST =  \n %@",posts);
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
