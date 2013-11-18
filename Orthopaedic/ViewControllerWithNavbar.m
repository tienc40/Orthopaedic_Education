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
#define MENU_WIDTH 50

@interface ViewControllerWithNavbar ()<UISearchBarDelegate>
{
    UIButton *_searchBtn;
    UIButton *_categoryButton;
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
//    self.navigationItem.leftBarButtonItem = categoryMenu;

}

- (void) viewDidAppear:(BOOL)animated
{
    
    [self resetBarItem];
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

#pragma mark category action

- (void) categoryBtnAction{
    _tableMenu.hidden = 1-_tableMenu.hidden;
}

#pragma mark menu delegate

- (void) didSelectItem:(int)rowIndex
{
    _tableMenu.hidden =YES;
    NSLog(@"%d",rowIndex);
}


#pragma mark search btn

- (void) searchBtnAction{
    [UIView animateWithDuration:0.4 animations:^{
        UIButton *closeBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        closeBtn.frame = CGRectMake(0, 0, MENU_WIDTH, 40);
        [closeBtn addTarget:self action:@selector(closeSearch) forControlEvents:UIControlEventTouchUpInside];
        [closeBtn setTitle:@"close" forState:UIControlStateNormal];
        
        UIBarButtonItem *closeBarBtn = [[UIBarButtonItem alloc]initWithCustomView:closeBtn];
        
        UIBarButtonItem *sb = [[UIBarButtonItem alloc] initWithCustomView:_searchBar];
        
        self.navigationItem.rightBarButtonItems = [NSArray arrayWithObjects:_negativeSpacer,closeBarBtn,sb, nil];
        self.navigationItem.title = @"";
        
        [_searchBar becomeFirstResponder];
    }];
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

@end
