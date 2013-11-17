//
//  Z115WordPressAPIClient.h
//  Orthopaedic
//
//  Created by TienT on 11/15/13.
//  Copyright (c) 2013 TienT. All rights reserved.
//

#import "AFHTTPClient.h"

@class Z115WordPressPost;

@interface Z115WordPressAPIClient : AFHTTPClient

+ (instancetype)sharedClient;
- (void)loadFromPostId:(NSString *)postId
           withSuccess:(void (^)(Z115WordPressPost* post))success
           withFailure:(void (^)(NSError *error))failure;
- (void)loadFromPostUrl:(NSURL *)postUrl
            withSuccess:(void (^)(Z115WordPressPost* post))success
            withFailure:(void (^)(NSError *error))failure;

@end
