//
//  Z115WordPressImage.h
//  Orthopaedic
//
//  Created by TienT on 11/15/13.
//  Copyright (c) 2013 TienT. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Z115WordPressImage : NSObject

@property (nonatomic, assign) NSInteger height;
@property (nonatomic, strong) NSString *url;
@property (nonatomic, assign) NSInteger width;

+ (Z115WordPressImage *)instanceFromDictionary:(NSDictionary *)aDictionary;
- (void)setAttributesFromDictionary:(NSDictionary *)aDictionary;

@end
