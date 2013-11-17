//
//  Z115WordpressCategory.m
//  Orthopaedic
//
//  Created by TienT on 11/15/13.
//  Copyright (c) 2013 TienT. All rights reserved.
//

#import "Z115WordPressCategory.h"

@implementation Z115WordPressCategory

+ (Z115WordPressCategory *)instanceFromDictionary:(NSDictionary *)aDictionary
{
    
    Z115WordPressCategory *instance = [[Z115WordPressCategory alloc] init];
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
    
    if ([key isEqualToString:@"id"]) {
        [self setValue:value forKey:@"z115WordPressCategoryId"];
    } else if ([key isEqualToString:@"description"]) {
        [self setValue:value forKey:@"descriptionText"];
    } else if ([key isEqualToString:@"post_count"]) {
        [self setValue:value forKey:@"postCount"];
    } else {
        NSLog(@"undefined key: %@", key);
        //[super setValue:value forUndefinedKey:key];
    }
    
}

@end
