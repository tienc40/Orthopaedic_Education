//
//  Z115WordPressPost.h
//  Orthopaedic
//
//  Created by TienT on 11/15/13.
//  Copyright (c) 2013 TienT. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Z115WordPressPostAuthor;
@class Z115WordPressPostAttachment;
@class Z115WordPressPostComment;

@interface Z115WordPressPost : NSObject

@property (nonatomic, strong) NSArray *attachments;
@property (nonatomic, strong) Z115WordPressPostAuthor *author;
@property (nonatomic, strong) NSArray *categories;
@property (nonatomic, strong) NSNumber *commentCount;
@property (nonatomic, strong) NSArray *comments;
@property (nonatomic, strong) NSString *commentStatus;
@property (nonatomic, strong) NSString *content;
@property (nonatomic, strong) NSString *date;
@property (nonatomic, strong) NSDate *postDate;
@property (nonatomic, strong) NSString *excerpt;
@property (nonatomic, strong) NSString *modified;
@property (nonatomic, strong) NSNumber *z115WordPressPostId;
@property (nonatomic, strong) NSString *slug;
@property (nonatomic, strong) NSString *status;
@property (nonatomic, strong) NSArray *tags;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *titlePlain;
@property (nonatomic, strong) NSString *type;
@property (nonatomic, strong) NSString *url;
@property (nonatomic, strong) NSString *thumbnail;
@property (strong, nonatomic) NSString *previousUrl;
@property (strong, nonatomic) NSString *nextUrl;
@property (strong, nonatomic) NSString *previousTitle;
@property (strong, nonatomic) NSString *nextTitle;
@property (strong, nonatomic) NSString *postHtml;

+ (Z115WordPressPost *)instanceFromDictionary:(NSDictionary *)aDictionary;

- (void)setAttributesFromDictionary:(NSDictionary *)aDictionary;

- (NSString *)getThumbnailUrl;
- (Z115WordPressPostAttachment *)findAttachment:(NSString *)url;
- (NSInteger)findAttachmentIndex:(NSString *)url;
- (BOOL)isPhotogallery;
- (NSString *)formattedDate;
- (NSString *)relativeDate;
- (void)addComment:(Z115WordPressPostComment *)comment;
- (NSString *)generateHtml:(int)fontSize;

@end
