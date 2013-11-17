//
//  Z115WordpressPostAuthor.m
//  Orthopaedic
//
//  Created by TienT on 11/15/13.
//  Copyright (c) 2013 TienT. All rights reserved.
//

#import "Z115WordPressPostAuthor.h"

@implementation Z115WordPressPostAuthor

+ (Z115WordPressPostAuthor *)instanceFromDictionary:(NSDictionary *)aDictionary
{
    
    Z115WordPressPostAuthor *instance = [[Z115WordPressPostAuthor alloc] init];
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
    } else if ([key isEqualToString:@"first_name"]) {
        [self setValue:value forKey:@"firstName"];
    } else if ([key isEqualToString:@"last_name"]) {
        [self setValue:value forKey:@"lastName"];
    } else if ([key isEqualToString:@"id"]) {
        [self setValue:value forKey:@"z115WordPressPostAuthorId"];
    } else {
        NSLog(@"undefined key: %@", key);
        //[super setValue:value forUndefinedKey:key];
    }
    
}


@end
