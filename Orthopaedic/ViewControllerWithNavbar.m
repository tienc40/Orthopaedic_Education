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
#define MENU_WIDTH 50

@interface ViewControllerWithNavbar ()<UISearchBarDelegate>
{
    UIButton *_searchBtn;
    UIButton *_categoryButton;
    UIButton *_backBtn;
    UISearchBar *_searchBar;
    int _paddingWith;
    UIBarButtonItem *_negativeSpacer;
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
        _marginSearchbar = 10;
    }else{
        _paddingWith = 5;
        _marginSearchbar = 30;
    }
    
    _negativeSpacer = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    [_negativeSpacer setWidth:-_paddingWith];
    
    //Search
    _searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width - 2*MENU_WIDTH-_marginSearchbar, 30)];
    _searchBar.delegate = self;
    _searchBar.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    [_searchBar setBackgroundImage:[UIImage imageNamed:@"mainnavbg.png"]];
    
    _tableMenu = [[TableMenu alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    _tableMenu.hidden = YES;
    [self.view bringSubviewToFront:_tableMenu];
    [self.view addSubview:_tableMenu];
    _tableMenu.menuDelegate = self;
    [self resetBarItem];
    self.navigationController.delegate = self;
//    self.navigationItem.leftBarButtonItem = categoryMenu;

}

-(void)viewWillAppear:(BOOL)animated
{
    NSLog(@"appear");
}
- (void) viewDidAppear:(BOOL)animated
{
    
    
}

- (void) resetBarItem
{
    [UIView animateWithDuration:0.4 animations:^{
        // title menu
        self.navigationItem.title = @"Latest Posts";
        
        // category menu
        if (!_categoryButton) {
            _categoryButton = [[UIButton alloc] initWithFrame: CGRectMake(0, 0, MENU_WIDTH, 44.0f)];
        }

        [_categoryButton setImage:[UIImage imageNamed:@"categoryMenubtn.png"]  forState:UIControlStateNormal];
        [_categoryButton addTarget:self action:@selector(categoryBtnAction) forControlEvents:UIControlEventTouchUpInside];
        
        UIBarButtonItem *categoryMenu =[[UIBarButtonItem alloc] initWithCustomView:_categoryButton];
        
        
        // btn search
        _searchBtn = [[UIButton alloc]initWithFrame: CGRectMake(0, 0, MENU_WIDTH, 44.0f)];
        [_searchBtn setImage:[UIImage imageNamed:@"searchbtn.png"] forState:UIControlStateNormal];
        [_searchBtn addTarget:self action:@selector(searchBtnAction) forControlEvents:UIControlEventTouchUpInside];
        
        
        UIBarButtonItem *searchItem = [[UIBarButtonItem alloc] initWithCustomView:_searchBtn];
        
        self.navigationItem.leftBarButtonItems = [NSArray arrayWithObjects:_negativeSpacer,categoryMenu,nil];
        self.navigationItem.rightBarButtonItems = [NSArray arrayWithObjects:_negativeSpacer,searchItem, nil];
    }];
}

#pragma mark leftItem

- (void) categoryBtnAction{
    
        [UIView animateWithDuration:0.4 delay:0 options:UIViewAnimationOptionTransitionNone animations:^{
            _tableMenu.hidden = 1-_tableMenu.hidden;
        } completion:^(BOOL finished) {
            
        }];
    
}
//hahha
-(void)setBackButton{
    if (!_backBtn) {
        _backBtn = [[UIButton alloc]initWithFrame: CGRectMake(0, 0, MENU_WIDTH, 44.0f)];
    }
    //    [_searchBtn setImage:[UIImage imageNamed:@"searchbtn.png"] forState:UIControlStateNormal];

    UIBarButtonItem *backItem = [[UIBarButtonItem alloc]initWithCustomView:_backBtn];
//    [_backBtn setTitle:@"Back" forState:UIControlStateNormal];
    [_backBtn setImage:[UIImage imageNamed:@"backbtn.png"] forState:UIControlStateNormal];
    [_backBtn addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItems = [NSArray arrayWithObjects:_negativeSpacer,backItem, nil];
}

- (void)back
{
    [self.navigationController popViewControllerAnimated:YES];
}


#pragma mark right item

- (void) searchBtnAction{
//    [UIView animateWithDuration:0.4 animations:^{
    UIButton *closebtn = [[UIButton alloc]initWithFrame: CGRectMake(0, 0, MENU_WIDTH, 44.0f)];
    [closebtn setImage:[UIImage imageNamed:@"closebtn.png"] forState:UIControlStateNormal];
    [closebtn addTarget:self action:@selector(closeSearch) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *closeBarBtn = [[UIBarButtonItem alloc]initWithCustomView:closebtn];
    
    UIBarButtonItem *sb = [[UIBarButtonItem alloc] initWithCustomView:_searchBar];
    
    self.navigationItem.rightBarButtonItems = [NSArray arrayWithObjects:_negativeSpacer,closeBarBtn,sb, nil];
    self.navigationItem.title = @"";
    
    [_searchBar becomeFirstResponder];
    //    }];
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


#pragma mark searchbar delegate


-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    [self resetBarItem];
}
#pragma mark menu delegate

- (void) didSelectItem:(int)rowIndex
{
    self.tableMenu.hidden =YES;
    AppDelegate *appdelegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    
    [appdelegate.tabController setSelectedIndex:2];
    [appdelegate.tabController.viewControllers[2] popToRootViewControllerAnimated:YES];
    
    NSLog(@"%d",rowIndex);
}

@end
