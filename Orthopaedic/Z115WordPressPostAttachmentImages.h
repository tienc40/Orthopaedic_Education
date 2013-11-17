//
//  Z115WordPressPostAttachmentImages.h
//  Orthopaedic
//
//  Created by TienT on 11/15/13.
//  Copyright (c) 2013 TienT. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Z115WordPressImage;

@interface Z115WordPressPostAttachmentImages : NSObject

@property (nonatomic, strong) Z115WordPressImage *full;
@property (nonatomic, strong) Z115WordPressImage *large;
@property (nonatomic, strong) Z115WordPressImage *largeFeature;
@property (nonatomic, strong) Z115WordPressImage *medium;
@property (nonatomic, strong) Z115WordPressImage *postThumbnail;
@property (nonatomic, strong) Z115WordPressImage *smallFeature;
@property (nonatomic, strong) Z115WordPressImage *thumbnail;

+ (Z115WordPressPostAttachmentImages *)instanceFromDictionary:(NSDictionary *)aDictionary;
- (void)setAttributesFromDictionary:(NSDictionary *)aDictionary;

@end
