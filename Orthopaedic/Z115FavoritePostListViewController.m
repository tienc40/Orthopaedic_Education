//
//  Z115FavoritePostListViewController.m
//  Orthopaedic
//
//  Created by TienT on 11/29/13.
//  Copyright (c) 2013 TienT. All rights reserved.
//

#import "Z115FavoritePostListViewController.h"
#import "Z115PostViewController.h"

#import "TTTAttributedLabel.h"
#import "NSString+HTML.h"
#import "UIColor+Z115WordPress.h"

#import "Z115PullToRefreshContentView.h"

#import "Z115PostListDataSource.h"

#import "Z115PostTableViewCell.h"
#import "Z115LoadMoreCell.h"
#import "Z115StarButton.h"

#import "Z115WordPressPost.h"
#import "Z115WordPressCategory.h"
#import "Z115WordPressTag.h"
#import "Z115WordPressPostAuthor.h"

#import "Z115Post.h"

@interface Z115FavoritePostListViewController ()
@property (strong, nonatomic) SSPullToRefreshView *pullToRefreshView;
@property (nonatomic, strong) UIView *loadingView;
@end

@implementation Z115FavoritePostListViewController

- (id)initWithAuthorId:(NSNumber *)authorId
{
    self = [self initWithNibName:nil bundle:nil];
    if (self)
    {
        // Custom initialization
        self.authorId = authorId;
        
    }
    return self;
}

- (id)initWithCategoryId:(NSNumber *)categoryId
{
    self = [self initWithNibName:nil bundle:nil];
    if (self)
    {
        // Custom initialization
        self.categoryId = categoryId;
        
    }
    return self;
}

- (id)initWithTagId:(NSNumber *)tagId
{
    self = [self initWithNibName:nil bundle:nil];
    if (self)
    {
        // Custom initialization
        self.tagId = tagId;
        
    }
    return self;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        // Custom initialization
        
    }
    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    //[self.backgroundImage setHidden:YES];
    //[self.view setBackgroundColor:[UIColor whiteColor]];
    
    self.dataSource = [Z115PostListDataSource new];
    self.dataSource.postViewController = self;
    
    self.pullToRefreshView = [[SSPullToRefreshView alloc] initWithScrollView:self.tableView delegate:self];
    self.pullToRefreshView.contentView = [[Z115PullToRefreshContentView alloc] initWithFrame:CGRectZero];
    
    if (self.authorId)
    {
        [self.dataSource fetchAuthorPosts:self.authorId];
    }
    else if (self.categoryId)
    {
        [self.dataSource fetchCategory:self.categoryId];
    }
    else if (self.tagId)
    {
        [self.dataSource fetchTag:self.tagId];
    }
    else
    {
        [self.dataSource fetchRecentPosts];
    }
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self.dataSource;
    
    self.tableView.backgroundColor = [UIColor clearColor];
    
    [self loadData];
    
}

- (void)loadData
{
    [self loadCoreDataPosts];
}

- (void)viewDidUnload {
    [super viewDidUnload];
    self.pullToRefreshView = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [[self.tableView cellForRowAtIndexPath:[self.tableView indexPathForSelectedRow]] setSelected:NO animated:YES];
    
    self.navigationController.toolbarHidden = YES;
    
    if ([self.dataSource hasUpdates])
    {
        self.dataSource.updates = NO;
        
        [self.tableView reloadData];
        
    }
    
    NSLog(@"-------------> Changed");

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

-(NSUInteger)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskPortrait;
}

-(BOOL)shouldAutorotate
{
    return NO;
}

- (void)loadPosts:(BOOL)more
{
    [self loadCoreDataPosts];
}

- (void)loadCoreDataPosts
{
    [self.dataSource loadPostFromCoreData];
}

- (void)finishedLoad:(BOOL)more
{
    self.dataSource.updates = NO;
    
    [self.tableView reloadData];
    [self.pullToRefreshView finishLoading];
    
    [self.pullToRefreshView.contentView setLastUpdatedAt:[NSDate date] withPullToRefreshView:self.pullToRefreshView];
    
    [self removeLoading];
}

- (void) endRefresh
{
    [self removeLoading];
}

- (void)showLoading
{
    if (!self.loadingView)
    {
        self.loadingView = [[UIView alloc] initWithFrame:CGRectMake(0, -44, 320, 44)];
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 11, 300, 21)];
        label.text = @"Loading...";
        label.textColor = [UIColor whiteColor];
        label.backgroundColor = [UIColor clearColor];
        
        [self.loadingView addSubview:label];
        self.loadingView.backgroundColor = [UIColor colorWithHexString:@"#226CA4"];
        
        [self.view addSubview:self.loadingView];
        [self.view bringSubviewToFront:self.loadingView];
    }
    
    [self.pullToRefreshView finishLoading];
    
    [UIView animateWithDuration:0.3f animations:^() {
        self.loadingView.frame = CGRectMake(0, 0, 320, 44);
    }];
}

- (void)removeLoading
{
    [UIView animateWithDuration:0.3f animations:^() {
        self.loadingView.frame = CGRectMake(0, -44, 320, 44);
    }];
}

- (void)viewPost:(Z115PostTableViewCell *)cell
{
    [self tableView:self.tableView didSelectRowAtIndexPath:[self.tableView indexPathForCell:cell]];
}

#pragma mark - Table view delegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (((indexPath.row + 1) == [self.dataSource tableView:self.tableView numberOfRowsInSection:indexPath.section]) && [self.dataSource canLoadMore])
    {
        return 44.0f;
    }
    
    Z115WordPressPost *post = self.dataSource.items[indexPath.row];
    
    TTTAttributedLabel *storyTitle = [[TTTAttributedLabel alloc] init];
    storyTitle.font = [UIFont boldSystemFontOfSize:17.0f];
    storyTitle.numberOfLines = 2;
    storyTitle.verticalAlignment = TTTAttributedLabelVerticalAlignmentTop;
    storyTitle.text = [post.titlePlain stringByReplacingHTMLEntities];
    
    CGSize requiredSize = [storyTitle sizeThatFits:CGSizeMake(268.0f, CGFLOAT_MAX)];
    
    return 194.0f + requiredSize.height;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [[tableView cellForRowAtIndexPath:indexPath] setSelected:NO animated:YES];
    
    if ([[tableView cellForRowAtIndexPath:indexPath] isKindOfClass:[Z115LoadMoreCell class]])
    {
        return;
    }
    
    Z115PostViewController *postViewController = [[Z115PostViewController alloc] initWithDataSource:self.dataSource withStartIndex:indexPath.row];
    postViewController.delegate = self;
    [self.navigationController pushViewController:postViewController animated:YES];
    
    
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([cell isKindOfClass:[Z115LoadMoreCell class]])
    {
        if (![self.dataSource isLoading])
        {
            [self loadPosts:YES];
        }
    }
}

- (void)searchByText:(NSString *)text
{
    self.navigationItem.title = [NSString stringWithFormat:@"Search: %@",text];
    [super resetBarItem];
    [self.dataSource searchPosts:text];
    [self loadPosts:NO];
}



-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    [self searchByText:searchBar.text];
}

- (IBAction)starButtonTapped:(id)sender {
    
    Z115StarButton *button = (Z115StarButton *)sender;
    
    Z115PostTableViewCell *cell = (Z115PostTableViewCell *)button.superview.superview.superview;
    NSIndexPath *indexPath = [self.tableView indexPathForCell:cell];
    
    Z115WordPressPost *post = [self.dataSource.items objectAtIndex:indexPath.row];
    
    if([button switchStar]) {
        [button savePost:post];
    } else {
        [button deletePost:post];
    }
}

#pragma mark -
#pragma mark MSPullToRefreshDelegate Methods

- (void)pullToRefreshViewDidStartLoading:(SSPullToRefreshView *)view {
    [self.pullToRefreshView startLoading];
    [self loadPosts:NO];
}

#pragma mark -
#pragma mark MenuDelegate Methods
- (void) didSelectItem:(NSNumber *)rowIndex withName:(NSString *)rowName
{
    [super didSelectItem:rowIndex withName:rowName];
    self.navigationItem.title = rowName;
    if(rowIndex == 0) {
        [self.dataSource fetchRecentPosts];
    } else {
        [self.dataSource fetchCategory:rowIndex];
    }
    [self loadPosts:NO];
}

#pragma mark -
#pragma mark PostListDelegate Methods
- (void) didSearchPosts:(NSString *) text
{
    [self searchByText:text];
}

@end
