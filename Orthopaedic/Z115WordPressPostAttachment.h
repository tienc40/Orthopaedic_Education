//
//  Z115WordPressPostAttachment.h
//  Orthopaedic
//
//  Created by TienT on 11/15/13.
//  Copyright (c) 2013 TienT. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Z115WordPressPostAttachmentImages;

@interface Z115WordPressPostAttachment : NSObject

@property (nonatomic, strong) NSNumber *z115WordPressPostAttachmentId;
@property (nonatomic, strong) NSString *caption;
@property (nonatomic, strong) NSString *descriptionText;
@property (nonatomic, strong) Z115WordPressPostAttachmentImages *images;
@property (nonatomic, strong) NSString *mimeType;
@property (nonatomic, strong) NSNumber *parent;
@property (nonatomic, strong) NSString *slug;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *url;

+ (Z115WordPressPostAttachment *)instanceFromDictionary:(NSDictionary *)aDictionary;
- (void)setAttributesFromDictionary:(NSDictionary *)aDictionary;

@end
