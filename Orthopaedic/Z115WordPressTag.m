//
//  Z115WordPressTag.m
//  Orthopaedic
//
//  Created by TienT on 11/15/13.
//  Copyright (c) 2013 TienT. All rights reserved.
//

#import "Z115WordPressTag.h"

@implementation Z115WordPressTag

+ (Z115WordPressTag *)instanceFromDictionary:(NSDictionary *)aDictionary
{
    
    Z115WordPressTag *instance = [[Z115WordPressTag alloc] init];
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

- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    
    if ([key isEqualToString:@"description"]) {
        [self setValue:value forKey:@"descriptionText"];
    } else if ([key isEqualToString:@"post_count"]) {
        [self setValue:value forKey:@"postCount"];
    } else if ([key isEqualToString:@"id"]) {
        [self setValue:value forKey:@"z115WordPressTagId"];
    } else {
        NSLog(@"undefined key: %@", key);
        
        //[super setValue:value forUndefinedKey:key];
    }
    
}


@end
