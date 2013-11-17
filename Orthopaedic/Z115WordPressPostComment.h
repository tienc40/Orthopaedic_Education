//
//  Z115WordPressPostComment.h
//  Orthopaedic
//
//  Created by TienT on 11/15/13.
//  Copyright (c) 2013 TienT. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Z115WordPressPostAuthor;

@interface Z115WordPressPostComment : NSObject

@property (nonatomic, strong) NSNumber *z115WordPressPostCommentId;
@property (nonatomic, strong) NSString *content;
@property (nonatomic, strong) NSString *date;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSNumber *parent;
@property (nonatomic, strong) NSString *url;
@property (nonatomic, strong) NSString *status;
@property (nonatomic, strong) NSString *avatar;
@property (nonatomic, strong) NSArray *childComments;
@property (nonatomic, strong) Z115WordPressPostAuthor *author;
@property (nonatomic, strong) NSDate *commentDate;
@property (nonatomic, assign) NSInteger childLevel;

+ (Z115WordPressPostComment *)instanceFromDictionary:(NSDictionary *)aDictionary;
- (void)setAttributesFromDictionary:(NSDictionary *)aDictionary;
- (NSString *)formattedDate;

@end
