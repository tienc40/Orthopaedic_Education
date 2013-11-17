//
//  Z115WordPressPost.m
//  Orthopaedic
//
//  Created by TienT on 11/15/13.
//  Copyright (c) 2013 TienT. All rights reserved.
//

#import "GTMNSString+HTML.h"
#import "SORelativeDateTransformer.h"

#import "Z115WordPressPost.h"

#import "Z115WordPressPostAttachment.h"
#import "Z115WordPressPostAuthor.h"
#import "Z115WordPressCategory.h"
#import "Z115WordPressPostComment.h"
#import "Z115WordPressTag.h"

#import "Z115WordPressPostAttachmentImages.h"
#import "Z115WordPressImage.h"

static NSDateFormatter *sPostDateFormatter = nil;
static SORelativeDateTransformer *sRelativetDateFormatter = nil;

@implementation Z115WordPressPost

+ (Z115WordPressPost *)instanceFromDictionary:(NSDictionary *)aDictionary
{
    Z115WordPressPost *instance = [[Z115WordPressPost alloc] init];
    [instance setAttributesFromDictionary:aDictionary];
    return instance;
}

- (void)setAttributesFromDictionary:(NSDictionary *)aDictionary
{
    if (![aDictionary isKindOfClass:[NSDictionary class]]) {
        return;
    }
    [self setValuesForKeysWithDictionary:aDictionary];
}

- (void)setValue:(id)value forKey:(NSString *)key
{
    
    if ([key isEqualToString:@"title"]) {
        self.title = [value gtm_stringByUnescapingFromHTML];
    } else if ([key isEqualToString:@"attachments"]) {
        
        if ([value isKindOfClass:[NSArray class]])
        {
            
            NSMutableArray *myMembers = [NSMutableArray arrayWithCapacity:[value count]];
            for (id valueMember in value) {
                Z115WordPressPostAttachment *populatedMember = [Z115WordPressPostAttachment instanceFromDictionary:valueMember];
                [myMembers addObject:populatedMember];
            }
            
            self.attachments = myMembers;
            
        }
        
    } else if ([key isEqualToString:@"author"]) {
        
        if ([value isKindOfClass:[NSDictionary class]]) {
            self.author = [Z115WordPressPostAuthor instanceFromDictionary:value];
        }
        
    } else if ([key isEqualToString:@"categories"]) {
        
        if ([value isKindOfClass:[NSArray class]])
        {
            
            NSMutableArray *myMembers = [NSMutableArray arrayWithCapacity:[value count]];
            for (id valueMember in value) {
                Z115WordPressCategory *populatedMember = [Z115WordPressCategory instanceFromDictionary:valueMember];
                [myMembers addObject:populatedMember];
            }
            
            self.categories = myMembers;
            
        }
        
    } else if ([key isEqualToString:@"comments"]) {
        
        if ([value isKindOfClass:[NSArray class]])
        {
            NSMutableArray *myMembers = [NSMutableArray arrayWithCapacity:[value count]];
            for (id valueMember in value) {
                Z115WordPressPostComment *populatedMember = [Z115WordPressPostComment instanceFromDictionary:valueMember];
                [myMembers addObject:populatedMember];
            }
            
            [self sortComments:myMembers];
        }
        
    } else if ([key isEqualToString:@"tags"]) {
        
        if ([value isKindOfClass:[NSArray class]])
        {
            
            NSMutableArray *myMembers = [NSMutableArray arrayWithCapacity:[value count]];
            for (id valueMember in value) {
                Z115WordPressTag *populatedMember = [Z115WordPressTag instanceFromDictionary:valueMember];
                [myMembers addObject:populatedMember];
            }
            
            self.tags = myMembers;
            
        }
        
    }
    else if ([key isEqualToString:@"date"])
    {
        self.date = value;
        NSDateFormatter *df = [[NSDateFormatter alloc] init];
        [df setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
        self.postDate = [df dateFromString:value];
    }
    else
    {
        [super setValue:value forKey:key];
    }
    
}

- (NSArray *)flattenComments:(Z115WordPressPostComment *)comment
{
    if ([comment.childComments count])
    {
        NSMutableArray *comments = @[].mutableCopy;
        
        for (Z115WordPressPostComment *childComment in comment.childComments)
        {
            [comments addObject:childComment];
            
            if (childComment.childComments)
            {
                [comments addObjectsFromArray:[self flattenComments:childComment]];
            }
        }
        
        return comments;
    }
    
    return @[];
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    
    if ([key isEqualToString:@"comment_count"]) {
        [self setValue:value forKey:@"commentCount"];
    } else if ([key isEqualToString:@"comment_status"]) {
        [self setValue:value forKey:@"commentStatus"];
    } else if ([key isEqualToString:@"id"]) {
        [self setValue:value forKey:@"z115WordPressPostId"];
    } else if ([key isEqualToString:@"title_plain"]) {
        [self setValue:[value gtm_stringByUnescapingFromHTML] forKey:@"titlePlain"];
    } else if ([key isEqualToString:@"next_url"]) {
        [self setValue:value forKey:@"nextUrl"];
    } else if ([key isEqualToString:@"previous_url"]) {
        [self setValue:value forKey:@"previousUrl"];
    } else if ([key isEqualToString:@"next_title"]) {
        [self setValue:value forKey:@"nextTitle"];
    } else if ([key isEqualToString:@"previous_title"]) {
        [self setValue:value forKey:@"previousTitle"];
    } else {
        NSLog(@"undefined key: %@", key);
        
        //[super setValue:value forUndefinedKey:key];
    }
    
}

- (NSString *) getThumbnailUrl
{
    if ([self.thumbnail length])
    {
        return self.thumbnail;
    }
    
	if ([self.attachments count])
	{
		Z115WordPressPostAttachment* attachement = [self.attachments objectAtIndex:0];
        
        return attachement.images.medium.url;
	}
	
	return nil;
}

- (Z115WordPressPostAttachment *)findAttachment:(NSString *)url
{
    for (Z115WordPressPostAttachment *item in self.attachments)
    {
        if ([item.url isEqualToString:url])
        {
            return item;
        }
    }
    
    return nil;
}

- (NSInteger)findAttachmentIndex:(NSString *)url
{
    NSInteger index = 0;
    for (Z115WordPressPostAttachment *item in self.attachments)
    {
        if ([item.url isEqualToString:url])
        {
            return index;
        }
        
        index++;
    }
    
    return 0;
}

- (BOOL)isPhotogallery
{
    return ([self.attachments count] > 3);
}

- (NSString *)formattedDate
{
    if (sPostDateFormatter == nil)
    {
        sPostDateFormatter = [NSDateFormatter new];
        [sPostDateFormatter setDateFormat:@"h:mm a, MMMM d, yyyy"];
    }
    
    return [sPostDateFormatter stringFromDate:self.postDate];
}

- (NSString *)relativeDate
{
    if (sRelativetDateFormatter == nil)
    {
        sRelativetDateFormatter = [SORelativeDateTransformer new];
    }
    
    return [sRelativetDateFormatter transformedValue:self.postDate];
}

- (void)addComment:(Z115WordPressPostComment *)comment
{
    NSMutableArray *items = self.comments.mutableCopy;
    [items addObject:comment];
    [self sortComments:items];
    
    self.commentCount = [NSNumber numberWithInt:[self.comments count]];
}

- (void)sortComments:(NSArray *)unorderedComments
{
    NSMutableDictionary *allComments = @{}.mutableCopy;
    
    for (Z115WordPressPostComment *valueMember in unorderedComments)
    {
        valueMember.childComments = nil;
        allComments[valueMember.z115WordPressPostCommentId] = valueMember;
    }
    
    NSArray *sortedComments = [unorderedComments sortedArrayUsingDescriptors:@[[NSSortDescriptor sortDescriptorWithKey:@"z115WordPressPostCommentId" ascending:YES]]];
    
    NSMutableArray *commentParents = @[].mutableCopy;
    
    for (Z115WordPressPostComment *comment in sortedComments)
    {
        if ([comment.parent intValue])
        {
            Z115WordPressPostComment *parentComment = allComments[comment.parent];
            
            if (parentComment)
            {
                if ([parentComment.childComments count])
                {
                    
                    NSMutableArray *childrenComments = parentComment.childComments.mutableCopy;
                    [childrenComments addObject:comment];
                    parentComment.childComments = childrenComments;
                }
                else
                {
                    parentComment.childComments = @[comment];
                }
                
                comment.childLevel = parentComment.childLevel + 1;
                
                allComments[comment.parent] = parentComment;
            }
            else
            {
                [commentParents addObject:comment];
            }
        }
        else
        {
            [commentParents addObject:comment];
        }
    }
    
    NSMutableArray *commentsWithChildren = @[].mutableCopy;
    for (Z115WordPressPostComment *comment in commentParents)
    {
        [commentsWithChildren addObject:comment];
        
        if ([comment.childComments count])
        {
            [commentsWithChildren addObjectsFromArray:[self flattenComments:comment]];
        }
        
    }
    
    self.comments = commentsWithChildren;
}

- (NSString *)generateHtml:(int)fontSize
{
    if (!self.postHtml)
    {
        NSMutableString *html = @"".mutableCopy;
        
        [html appendFormat:@"<html><head><script type=\"text/javascript\" src=\"z115wordpress.js\"></script>"];
        
        [html appendFormat:@"<style>#singlentry {font-size: %dpx;}</style><link href='default.css' rel='stylesheet' type='text/css' />", fontSize];
        
        [html appendFormat:@"</head><body id=\"contentbody\"><div id='maincontent' class='content'><div class='post'><div id='title'>%@</div><div><span class='date-color'>%@</span>&nbsp;<a class='author' href=\"z115wordpress://author:%@\">%@</a></div>",
         self.title,
         [self formattedDate],
         self.author.z115WordPressPostAuthorId,
         self.author.name];
        
        [html appendFormat:@"<div id='singlentry'>%@</div></div>", self.content];
        
        if ([self.categories count])
        {
            [html appendString:@"<div>"];
            
            for (Z115WordPressCategory *item in self.categories)
            {
                [html appendFormat:@"<a class=\"category\" href=\"z115wordpress://category:%@\">%@</a> ", item.z115WordPressCategoryId, item.title];
            }
            
            [html appendString:@"</div>"];
        }
        
        if ([self.tags count])
        {
            [html appendString:@"<div style=\"clear:both\">"];
            
            for (Z115WordPressTag *item in self.tags)
            {
                [html appendFormat:@"<a class=\"tag\" href=\"z115wordpress://tag:%@\">%@</a>", item.z115WordPressTagId, item.title];
            }
            
            [html appendString:@"</div>"];
        }
        
        if (([html rangeOfString:@"twitter-tweet"].location != NSNotFound) && ([html rangeOfString:@"widgets.js"].location == NSNotFound))
        {
            [html appendString:@"<script async src=\"//platform.twitter.com/widgets.js\" charset=\"utf-8\"></script>"];
        }
        
        html = [html stringByReplacingOccurrencesOfString:@"\"//platform.twitter.com/"
                                               withString:@"\"http://platform.twitter.com/"].mutableCopy;
        
        [html appendString:@"</div></body></html>"];
        
        self.postHtml = html;
    }
    return self.postHtml;
}


@end
