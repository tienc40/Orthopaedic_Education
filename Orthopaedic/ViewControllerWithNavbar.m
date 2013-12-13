//
//  ViewControllerWithNavbar.m
//  Orthopaedic
//
//  Created by Kiennd on 11/16/13.
//  Copyright (c) 2013 TienT. All rights reserved.
//

#import "ViewControllerWithNavbar.h"
#import "TableMenu.h"
#import "MainTabBar.h"
#import "AppDelegate.h"
#import "Z115PostListViewController.h"


@interface ViewControllerWithNavbar ()<UISearchBarDelegate>
{
    int _paddingWith;
    int _marginSearchbar;
}
@end


@implementation ViewControllerWithNavbar

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7)
    {
        self.edgesForExtendedLayout = UIRectEdgeNone;
        _paddingWith = 16;
        _marginSearchbar = 16;
    }else{
        _paddingWith = 5;
        _marginSearchbar = 21;
    }
    
    self.navigationController.navigationBar.alpha = 1;
    self.navigationController.navigationBar.translucent = NO;
    
    self.negativeSpacer = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    [self.negativeSpacer setWidth:-_paddingWith];
    
    //Search
    self.searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width - 2*MENU_WIDTH-_marginSearchbar, 30)];
    self.searchBar.delegate = self;
    self.searchBar.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    [self.searchBar setBackgroundImage:[UIImage imageNamed:@"mainnavbg.png"]];
    
    
    CGRect navframe = [[self.navigationController navigationBar] frame];
    CGRect tabframe = self.tabBarController.tabBar.frame;
    
    NSLog(@"%f",navframe.size.height);
    self.tableMenu = [[TableMenu alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height-navframe.size.height-tabframe.size.height)];
    self.tableMenu.hidden = YES;
    [self.view bringSubviewToFront:_tableMenu];
    [self.view addSubview:_tableMenu];
    self.tableMenu.menuDelegate = self;
    [self resetBarItem];
    self.navigationController.delegate = self;
    
    self.backgroundImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"mainbg.png"]];
    [self.backgroundImage setFrame:self.view.frame];
    [self.view addSubview:self.backgroundImage];
    [self.view sendSubviewToBack:self.backgroundImage];
    [self.view setBackgroundColor:[UIColor clearColor]];
    
    //[UIColor colorWithPatternImage:[UIImage imageNamed:@"mainbg.png"]];
}

- (void) resetBarItem
{
    [UIView animateWithDuration:0.4 animations:^{  
        // category menu
        if (!self.categoryBtn) {
            self.categoryBtn = [[UIButton alloc] initWithFrame: CGRectMake(0, 0, MENU_WIDTH, 44.0f)];
        }

        [self.categoryBtn setImage:[UIImage imageNamed:@"categoryMenubtn.png"]  forState:UIControlStateNormal];
        [self.categoryBtn addTarget:self action:@selector(categoryBtnAction) forControlEvents:UIControlEventTouchUpInside];
        
        UIBarButtonItem *categoryMenu =[[UIBarButtonItem alloc] initWithCustomView:self.categoryBtn];
        
        // btn search
        self.searchBtn = [[UIButton alloc]initWithFrame: CGRectMake(0, 0, MENU_WIDTH, 44.0f)];
        [self.searchBtn setImage:[UIImage imageNamed:@"searchbtn.png"] forState:UIControlStateNormal];
        [self.searchBtn addTarget:self action:@selector(searchBtnAction) forControlEvents:UIControlEventTouchUpInside];
        
        
        UIBarButtonItem *searchItem = [[UIBarButtonItem alloc] initWithCustomView:self.searchBtn];
        self.navigationItem.rightBarButtonItems = [NSArray arrayWithObjects:self.negativeSpacer,searchItem, nil];
        
        self.navigationItem.leftBarButtonItems = [NSArray arrayWithObjects:self.negativeSpacer,categoryMenu,nil];

    }];
}

#pragma mark leftItem

- (void) categoryBtnAction{
    
        [UIView animateWithDuration:0.4 delay:0 options:UIViewAnimationOptionTransitionNone animations:^{
            _tableMenu.hidden = 1-_tableMenu.hidden;
        } completion:^(BOOL finished) {
            
        }];
    
}

-(void)setBackButton{
    if (!self.backBtn) {
        self.backBtn = [[UIButton alloc]initWithFrame: CGRectMake(0, 0, MENU_WIDTH, 44.0f)];
    }

    UIBarButtonItem *backItem = [[UIBarButtonItem alloc]initWithCustomView:self.backBtn];
    [self.backBtn setImage:[UIImage imageNamed:@"backbtn.png"] forState:UIControlStateNormal];
    [self.backBtn addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItems = [NSArray arrayWithObjects:self.negativeSpacer,backItem, nil];
}

- (void)back
{
    [self.navigationController popToRootViewControllerAnimated:YES];
}

#pragma mark right item

- (void) searchBtnAction{
    //[UIView animateWithDuration:0.4 animations:^{
    UIButton *closebtn = [[UIButton alloc]initWithFrame: CGRectMake(0, 0, MENU_WIDTH, 44.0f)];
    [closebtn setImage:[UIImage imageNamed:@"closebtn.png"] forState:UIControlStateNormal];
    [closebtn addTarget:self action:@selector(closeSearch) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *closeBarBtn = [[UIBarButtonItem alloc]initWithCustomView:closebtn];
    
    UIBarButtonItem *sb = [[UIBarButtonItem alloc] initWithCustomView:self.searchBar];
    
    self.navigationItem.rightBarButtonItems = [NSArray arrayWithObjects:self.negativeSpacer,closeBarBtn,sb, nil];
    self.navigationItem.title = @"";
    
    [self.searchBar becomeFirstResponder];
    //}];
}

- (void) closeSearch
{
    [self resetBarItem];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -
#pragma mark searchbar delegate
-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    [self resetBarItem];
}

#pragma mark -
#pragma mark MenuDelegate Methods
- (void) didSelectItem:(NSNumber *)rowIndex withName:(NSString *)rowName
{
    self.tableMenu.hidden = YES;
    [self.tabBarController setSelectedIndex:2];
    [self.tabBarController.viewControllers[2] popToRootViewControllerAnimated:YES];
}


@end
