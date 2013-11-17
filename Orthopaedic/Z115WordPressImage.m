//
//  Z115WordPressImage.m
//  Orthopaedic
//
//  Created by TienT on 11/15/13.
//  Copyright (c) 2013 TienT. All rights reserved.
//

#import "Z115WordPressImage.h"

@implementation Z115WordPressImage

+ (Z115WordPressImage *)instanceFromDictionary:(NSDictionary *)aDictionary
{
    Z115WordPressImage *instance = [[Z115WordPressImage alloc] init];
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

@end
