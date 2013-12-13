//
//  Z115PostListDataSource.m
//  Orthopaedic
//
//  Created by TienT on 11/15/13.
//  Copyright (c) 2013 TienT. All rights reserved.
//

#import "Z115PostListDataSource.h"

#import "Z115WordPressPost.h"
#import "Z115WordPressCategory.h"
#import "Z115WordPressTag.h"

#import "Z115PostTableViewCell.h"
#import "Z115LoadMoreCell.h"

#import "TTTAttributedLabel.h"
#import "Z115StarButton.h"

#import "Z115Post.h"

@interface Z115PostListDataSource()

@property (strong, nonatomic) NSDictionary *params;
@property (assign, nonatomic) NSInteger postTotal;
@property (strong, nonatomic) NSDate * yesterday;
@property (strong, nonatomic) NSDictionary *postIds;

@end

@implementation Z115PostListDataSource

- (id)init
{
    self = [super init];
    
    if (self)
    {
        [self reset];
    }
    
    return self;
}


- (void)fetchRecentPosts
{
    self.params = @{@"json" : @"get_recent_posts"};
}

- (void)fetchAuthorPosts:(NSNumber *)authorId
{
    self.params = @{@"json" : @"get_author_posts", @"author_id" : authorId};
}

- (void)searchPosts:(NSString *)search
{
    self.params = @{@"json" : @"1", @"s" : search};
}

- (void)fetchCategory:(NSNumber *)categoryId
{
    self.params = @{@"json" : @"get_category_posts", @"id" : categoryId};
}

- (void)fetchTag:(NSNumber *)tagId
{
    self.params = @{@"json" : @"get_tag_posts", @"id" : tagId};
}

- (void)loadPostFromCoreData
{
    __block Z115PostListDataSource *blockSelf = self;
    
    [blockSelf reset];
    
    NSArray *posts = [Z115Post findAll];
    NSLog(@"%@",posts);
    
    [posts enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        
        Z115Post *coreDataPost = (Z115Post *)obj;
        
        Z115WordPressPost *post = [Z115WordPressPost new];
        
        post.content = coreDataPost.content;
        post.excerpt = coreDataPost.excerpt;
        post.modified = coreDataPost.modified;
        post.postDate = coreDataPost.postDate;
        post.postHtml = coreDataPost.postHtml;
        post.slug = coreDataPost.slug;
        post.status = coreDataPost.status;
        post.thumbnail = coreDataPost.thumbnail;
        post.title = coreDataPost.title;
        post.titlePlain = coreDataPost.titlePlain;
        post.z115WordPressPostId = coreDataPost.z115WordPressPostId;
        
        [blockSelf addPost:post];
        
        //NSLog(@"Title = %@",post.titlePlain);
        
    }];
    
}

- (void)loadMore:(BOOL)more withSuccess:(void (^)(void))success withFailure:(void (^)(NSError *error))failure
{
    //[self cancel];
    
    self.loading = YES;
    
    self.yesterday = [NSDate dateWithTimeIntervalSinceNow:-86400];
    
    self.page = (more) ? self.page + 1 : 1;
    
    NSMutableDictionary *fetchParams  = self.params.mutableCopy;
    fetchParams[@"page"] = [NSString stringWithFormat:@"%ld", (long)self.page];
    
    
    __block Z115PostListDataSource *blockSelf = self;
    
    [[Z115WordPressAPIClient sharedClient] getPath:@""
                                        parameters:fetchParams
                                           success:^(AFHTTPRequestOperation *operation, id JSON) {
                                               
                                               if (self.page == 1)
                                               {
                                                   [blockSelf reset];
                                               }
                                               
                                               for (NSDictionary *attributes in JSON[@"posts"])
                                               {
                                                   Z115WordPressPost *post = [Z115WordPressPost instanceFromDictionary:attributes];
                                                   
                                                   [blockSelf addPost:post];
                                               }
                                               
                                               if (JSON[@"tag"])
                                               {
                                                   blockSelf.tag = [Z115WordPressTag instanceFromDictionary:JSON[@"tag"]];
                                                   blockSelf.postTotal = [JSON[@"tag"][@"post_count"] intValue];
                                               }
                                               else if (JSON[@"category"])
                                               {
                                                   blockSelf.category = [Z115WordPressCategory instanceFromDictionary:JSON[@"category"]];
                                                   blockSelf.postTotal = [JSON[@"category"][@"post_count"] intValue];
                                               }
                                               else
                                               {
                                                   blockSelf.postTotal = (JSON[@"count_total"]) ? [JSON[@"count_total"] intValue] : [JSON[@"post_count"] intValue];
                                               }
                                               
                                               if (success)
                                               {
                                                   success();
                                               }
                                               
                                               blockSelf.loading = NO;
                                               
                                           } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                                               NSLog(@"Failure: %@", error);
                                               
                                               blockSelf.loading = NO;
                                               
                                               if (failure)
                                               {
                                                   failure(error);
                                               }
                                           }];
}

- (void)loadPostFromUrl:(NSString *)postUrl withSuccess:(void (^)(Z115WordPressPost* post))success withFailure:(void (^)(NSError *error))failure
{
    __block Z115PostListDataSource *blockSelf = self;
    
    [[Z115WordPressAPIClient sharedClient] loadFromPostUrl:[NSURL URLWithString:postUrl]
                                             withSuccess:^(Z115WordPressPost *post) {
                                                 [blockSelf addPost:post];
                                                 
                                                 if (success)
                                                 {
                                                     success(post);
                                                 }
                                                 
                                                 blockSelf.loading = NO;
                                             }
                                             withFailure:^(NSError *error){
                                                 if (failure)
                                                 {
                                                     failure(error);
                                                 }
                                             }];
}

- (BOOL)canLoadMore
{
    return (self.postTotal > [self.items count]);
}

- (void)cancel
{
    [[Z115WordPressAPIClient sharedClient] cancelAllHTTPOperationsWithMethod:@"GET" path:@""];
}

- (void)reset
{
    self.page = 1;
    self.postTotal = 0;
    self.postIds = @{};
    self.items = @[];
}

- (void)addPost:(Z115WordPressPost *)post
{
    if (!self.postIds[post.z115WordPressPostId])
    {
        NSMutableArray *posts = self.items.mutableCopy;
        [posts addObject:post];
        
        self.items = posts;
        
        NSMutableDictionary *ids = self.postIds.mutableCopy;
        ids[post.z115WordPressPostId] = [NSNumber numberWithInt:([self.items count] - 1)];
        
        self.postIds = ids;
        
        self.updates = YES;
    }
    else
    {
        NSMutableArray *posts = self.items.mutableCopy;
        [posts replaceObjectAtIndex:[self.postIds[post.z115WordPressPostId] intValue] withObject:post];
        
        self.items = posts;
    }
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if ([self canLoadMore])
    {
        return [self.items count] + 1;
    }
    
    return [self.items count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row < [self.items count])
    {
        
        Z115WordPressPost *post = [self.items objectAtIndex:indexPath.row];
        
        TTTAttributedLabel *storyTitle = [[TTTAttributedLabel alloc] init];
        storyTitle.font = [UIFont boldSystemFontOfSize:17.0f];
        storyTitle.numberOfLines = 2;
        storyTitle.verticalAlignment = TTTAttributedLabelVerticalAlignmentTop;
        storyTitle.text = [post.titlePlain stringByReplacingHTMLEntities];
        
        CGSize requiredSize = [storyTitle sizeThatFits:CGSizeMake(268.0f, CGFLOAT_MAX)];
        float rowHeight = 194.0f + requiredSize.height;
        
        NSString *cellIdentifier = @"Z115PostTableViewCell2";
        if(rowHeight == 234) {
            cellIdentifier = @"Z115PostTableViewCell";
        }
    
        Z115PostTableViewCell *cell = (Z115PostTableViewCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
        
        cell.yesterday = self.yesterday;
        cell.parentViewController = self.postViewController;
        [cell.starButton switchOff];

        
        Z115Post *coreDataPost = [Z115Post findFirstByAttribute:@"z115WordPressPostId" withValue:post.z115WordPressPostId];
        
        if(coreDataPost != nil) {
            [cell.starButton switchOn];
        }
        
        //NSLog(@"coreDataPost = %@",coreDataPost);
        //NSLog(@"Post = %@",post.titlePlain);
        //NSLog(@"===================================");
        
        [cell showPost:post];

        return cell;
    }
    else
    {
        
        Z115LoadMoreCell *cell = (Z115LoadMoreCell *)[tableView dequeueReusableCellWithIdentifier:@"Z115LoadMoreCell"];
        [cell.activityIndicator startAnimating];
        
        return cell;
        
    }
}
@end
