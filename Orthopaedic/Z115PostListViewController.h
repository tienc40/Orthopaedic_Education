//
//  Z115PostListViewController.h
//  Orthopaedic
//
//  Created by TienT on 11/15/13.
//  Copyright (c) 2013 TienT. All rights reserved.
//

#import "Z115ViewController.h"
#import "SSPullToRefresh.h"
#import "Z115PostViewController.h"

@class Z115PostListDataSource;
@class Z115PostTableViewCell;

@interface Z115PostListViewController : Z115ViewController <UITableViewDelegate, SSPullToRefreshViewDelegate,PostListDelegate>

@property (nonatomic, strong) IBOutlet UITableView *tableView;
@property (nonatomic, strong) Z115PostListDataSource *dataSource;

@property (strong, nonatomic) NSNumber *authorId;
@property (strong, nonatomic) NSNumber *categoryId;
@property (strong, nonatomic) NSNumber *tagId;

- (id)initWithAuthorId:(NSNumber *)authorId;
- (id)initWithCategoryId:(NSNumber *)catergoryId;
- (id)initWithTagId:(NSNumber *)tagId;
- (void)endRefresh;
- (void)loadPosts:(BOOL)more;
- (void)loadCoreDataPosts;
- (void)finishedLoad:(BOOL)more;
- (void)viewPost:(Z115PostTableViewCell *)cell;



@end

