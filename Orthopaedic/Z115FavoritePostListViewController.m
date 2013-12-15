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
@end

@implementation Z115FavoritePostListViewController

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
}

- (void)loadData
{
   [self loadCoreDataPosts];
} 

- (void)viewDidUnload {
    [super viewDidUnload];
}

- (void)viewWillAppear:(BOOL)animated
{
    
    [super viewWillAppear:animated];
    [self loadData];

}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
