//
//  Z115WordPressPostAttachment.m
//  Orthopaedic
//
//  Created by TienT on 11/15/13.
//  Copyright (c) 2013 TienT. All rights reserved.
//

#import "Z115WordPressPostAttachment.h"
#import "Z115WordPressPostAttachmentImages.h"

@implementation Z115WordPressPostAttachment

+ (Z115WordPressPostAttachment *)instanceFromDictionary:(NSDictionary *)aDictionary
{
    
    Z115WordPressPostAttachment *instance = [[Z115WordPressPostAttachment alloc] init];
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
    
    if ([key isEqualToString:@"images"]) {
        
        if ([value isKindOfClass:[NSDictionary class]]) {
            self.images = [Z115WordPressPostAttachmentImages instanceFromDictionary:value];
        }
        
    } else {
        [super setValue:value forKey:key];
    }
    
}


- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    
    if ([key isEqualToString:@"id"]) {
        [self setValue:value forKey:@"z115WordPressPostAttachmentId"];
    } else if ([key isEqualToString:@"description"]) {
        [self setValue:value forKey:@"descriptionText"];
    } else if ([key isEqualToString:@"mime_type"]) {
        [self setValue:value forKey:@"mimeType"];
    } else {
        NSLog(@"undefined key: %@", key);
        //[super setValue:value forUndefinedKey:key];
    }
    
}


@end
