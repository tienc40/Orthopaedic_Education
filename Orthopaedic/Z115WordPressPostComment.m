//
//  Z115WordPressPostComment.m
//  Orthopaedic
//
//  Created by TienT on 11/15/13.
//  Copyright (c) 2013 TienT. All rights reserved.
//

#import "Z115WordPressPostComment.h"
#import "Z115WordPressPostAuthor.h"

static NSDateFormatter *sPostCommentDateFormatter = nil;

@implementation Z115WordPressPostComment

+ (Z115WordPressPostComment *)instanceFromDictionary:(NSDictionary *)aDictionary
{
    
    Z115WordPressPostComment *instance = [[Z115WordPressPostComment alloc] init];
    [instance setAttributesFromDictionary:aDictionary];
    return instance;
    
}

- (id)init
{
    self = [super init];
    
    if (self)
    {
        self.childLevel = 0;
    }
    
    return self;
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
    if ([key isEqualToString:@"date"])
    {
        self.date = value;
        NSDateFormatter *df = [[NSDateFormatter alloc] init];
        [df setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
        self.commentDate = [df dateFromString:value];
    }
    else
    {
        [super setValue:value forKey:key];
    }
    
}


- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    
    if ([key isEqualToString:@"id"])
    {
        [self setValue:value forKey:@"z115WordPressPostCommentId"];
    }
    else if ([key isEqualToString:@"author"])
    {
        if ([value isKindOfClass:[NSDictionary class]])
        {
            self.author = [Z115WordPressPostAuthor instanceFromDictionary:value];
        }
    }
    else
    {
        NSLog(@"undefined key: %@", key);
        
        //[super setValue:value forUndefinedKey:key];
    }
    
}

- (NSString *)formattedDate
{
    if (sPostCommentDateFormatter == nil)
    {
        sPostCommentDateFormatter = [NSDateFormatter new];
        [sPostCommentDateFormatter setDateFormat:@"h:mm a, MMMM d, yyyy"];
    }
    
    return [sPostCommentDateFormatter stringFromDate:self.commentDate];
}


@end
