//
//  Z115PostListViewController.h
//  Orthopaedic
//
//  Created by TienT on 11/15/13.
//  Copyright (c) 2013 TienT. All rights reserved.
//

#import "Z115ViewController.h"
#import "SSPullToRefresh.h"

@class Z115PostListDataSource;
@class Z115PostTableViewCell;

@interface Z115PostListViewController : Z115ViewController <UITableViewDelegate, SSPullToRefreshViewDelegate>

@property (nonatomic, strong) IBOutlet UITableView *tableView;
@property (nonatomic, strong) Z115PostListDataSource *dataSource;

- (id)initWithAuthorId:(NSNumber *)authorId;
- (id)initWithCategoryId:(NSNumber *)catergoryId;
- (id)initWithTagId:(NSNumber *)tagId;
- (void)endRefresh;
- (void)loadPosts:(BOOL)more;
- (void)finishedLoad:(BOOL)more;
- (void)viewPost:(Z115PostTableViewCell *)cell;

@end
