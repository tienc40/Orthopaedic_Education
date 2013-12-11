//
//  Z115PostListDataSource.h
//  Orthopaedic
//
//  Created by TienT on 11/15/13.
//  Copyright (c) 2013 TienT. All rights reserved.
//

#import "Z115DataSource.h"

typedef void (^Z115SuccessBlock)(void);
typedef void (^Z115FailureBlock)(NSError *error);

@class Z115WordPressPost;
@class Z115PostListViewController;
@class Z115WordPressCategory;
@class Z115WordPressTag;

@interface Z115PostListDataSource : Z115DataSource

@property (assign, nonatomic) NSInteger page;
@property (strong, nonatomic) Z115WordPressCategory *category;
@property (strong, nonatomic) Z115WordPressTag *tag;

@property (assign,nonatomic,getter=hasUpdates) BOOL updates;
@property (weak, nonatomic) Z115PostListViewController *postViewController;

- (void)fetchRecentPosts;
- (void)fetchAuthorPosts:(NSNumber *)authorId;
- (void)fetchCategory:(NSNumber *)categoryId;
- (void)fetchTag:(NSNumber *)tagId;
- (void)loadPostFromCoreData;
- (void)loadMore:(BOOL)more withSuccess:(void (^)(void))success withFailure:(void (^)(NSError *error))failure;
- (void)loadPostFromUrl:(NSString *)postUrl withSuccess:(void (^)(Z115WordPressPost* post))success withFailure:(void (^)(NSError *error))failure;
- (BOOL)canLoadMore;
- (void)searchPosts:(NSString *)search;
- (void)cancel;
- (void)addPost:(Z115WordPressPost *)post;

@end
