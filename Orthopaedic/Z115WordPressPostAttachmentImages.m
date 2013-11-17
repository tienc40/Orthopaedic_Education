//
//  Z115WordPressPostAttachmentImages.m
//  Orthopaedic
//
//  Created by TienT on 11/15/13.
//  Copyright (c) 2013 TienT. All rights reserved.
//

#import "Z115WordPressPostAttachmentImages.h"
#import "Z115WordPressImage.h"

@implementation Z115WordPressPostAttachmentImages

+ (Z115WordPressPostAttachmentImages *)instanceFromDictionary:(NSDictionary *)aDictionary
{
    Z115WordPressPostAttachmentImages *instance = [[Z115WordPressPostAttachmentImages alloc] init];
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
    if ([key isEqualToString:@"full"]) {
        
        if ([value isKindOfClass:[NSDictionary class]]) {
            self.full = [Z115WordPressImage instanceFromDictionary:value];
        }
        
    } else if ([key isEqualToString:@"large"]) {
        
        if ([value isKindOfClass:[NSDictionary class]]) {
            self.large = [Z115WordPressImage instanceFromDictionary:value];
        }
        
    } else if ([key isEqualToString:@"large-feature"]) {
        
        if ([value isKindOfClass:[NSDictionary class]]) {
            self.largeFeature = [Z115WordPressImage instanceFromDictionary:value];
        }
        
    } else if ([key isEqualToString:@"medium"]) {
        
        if ([value isKindOfClass:[NSDictionary class]]) {
            self.medium = [Z115WordPressImage instanceFromDictionary:value];
        }
        
    } else if ([key isEqualToString:@"post-thumbnail"]) {
        
        if ([value isKindOfClass:[NSDictionary class]]) {
            self.postThumbnail = [Z115WordPressImage instanceFromDictionary:value];
        }
        
    } else if ([key isEqualToString:@"small-feature"]) {
        
        if ([value isKindOfClass:[NSDictionary class]]) {
            self.smallFeature = [Z115WordPressImage instanceFromDictionary:value];
        }
        
    } else if ([key isEqualToString:@"thumbnail"]) {
        
        if ([value isKindOfClass:[NSDictionary class]]) {
            self.thumbnail = [Z115WordPressImage instanceFromDictionary:value];
        }
        
    } else {
        [super setValue:value forKey:key];
    }
}


- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    if ([key isEqualToString:@"large-feature"]) {
        [self setValue:value forKey:@"largeFeature"];
    } else if ([key isEqualToString:@"post-thumbnail"]) {
        [self setValue:value forKey:@"postThumbnail"];
    } else if ([key isEqualToString:@"small-feature"]) {
        [self setValue:value forKey:@"smallFeature"];
    } else {
        NSLog(@"undefined key: %@", key);
        //[super setValue:value forUndefinedKey:key];
    }
}


@end
