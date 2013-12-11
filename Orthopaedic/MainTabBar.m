//
//  MainTabBar.m
//  Orthopaedic
//
//  Created by Kiennd on 11/15/13.
//  Copyright (c) 2013 TienT. All rights reserved.
//

#import "MainTabBar.h"
#import "AppDelegate.h"
#import "Z115PostListViewController.h"
#import "ViewControllerWithNavbar.h"
@interface MainTabBar ()
{
    UIButton* centerItem;
}
@end

@implementation MainTabBar

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.tabBarController.navigationItem.title = @"";
    // Change the tab bar background
    UIImage *tabBarBackground = [UIImage imageNamed:@"barbg.png"];
    [[UITabBar appearance] setBackgroundImage:tabBarBackground];

    self.selectedIndex = 2;
    
    UITabBar *tabBar = self.tabBar;
    UITabBarItem *tabBarItem1 = [tabBar.items objectAtIndex:0];
    UITabBarItem *tabBarItem2 = [tabBar.items objectAtIndex:1];
    UITabBarItem *tabBarItem3 = [tabBar.items objectAtIndex:2];
    UITabBarItem *tabBarItem4 = [tabBar.items objectAtIndex:3];
    UITabBarItem *tabBarItem5 = [tabBar.items objectAtIndex:4];
    
    tabBarItem1.title = @"";
    tabBarItem1.imageInsets = UIEdgeInsetsMake(6, -2, -6, 0);
    
    
    tabBarItem2.title = @"";
    tabBarItem2.imageInsets = UIEdgeInsetsMake(6, -8, -6, 2);
    
    
    tabBarItem3.title = @"";

    tabBarItem4.title = @"";
    tabBarItem4.imageInsets = UIEdgeInsetsMake(6, 2, -6, -8);
    
    tabBarItem5.title = @"";
    tabBarItem5.imageInsets = UIEdgeInsetsMake(6, 0, -6, -6);
    
    
//    [tabBarItem1 setFinishedSelectedImage:[UIImage imageNamed:@"info_s.png"] withFinishedUnselectedImage:[UIImage imageNamed:@"info.png"]];
    
    [tabBarItem1 setFinishedSelectedImage:[UIImage imageNamed:@"info_s.png"] withFinishedUnselectedImage:[UIImage imageNamed:@"info.png"]];
    [tabBarItem2 setFinishedSelectedImage:[UIImage imageNamed:@"setting1_s.png"] withFinishedUnselectedImage:[UIImage imageNamed:@"setting1.png"]];
    [tabBarItem3 setFinishedSelectedImage:[UIImage imageNamed:@"shop_s.png"] withFinishedUnselectedImage:[UIImage imageNamed:@"shop.png"]];
    
    
    [self addCenterButtonWithImage:[UIImage imageNamed:@"iconTab2.png"] highlightImage:nil];
    
    [tabBarItem4 setFinishedSelectedImage:[UIImage imageNamed:@"setting_s.png"] withFinishedUnselectedImage:[UIImage imageNamed:@"setting.png"]];
    [tabBarItem5 setFinishedSelectedImage:[UIImage imageNamed:@"message_s.png"] withFinishedUnselectedImage:[UIImage imageNamed:@"message.png"]];

    
//    self.delegate = self;
//    [self addCenterButtonWithImage:[UIImage imageNamed:@"icon3.png"] highlightImage:[UIImage imageNamed:@"icon3_selected.png"]];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void) addCenterButtonWithImage:(UIImage*)buttonImage highlightImage:(UIImage*)highlightImage
{
    centerItem = [UIButton buttonWithType:UIButtonTypeCustom];
    centerItem.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleTopMargin;
    centerItem.frame = CGRectMake(0.0, 0.0, buttonImage.size.width, buttonImage.size.height);
    [centerItem setBackgroundImage:buttonImage forState:UIControlStateNormal];
    [centerItem setBackgroundImage:highlightImage forState:UIControlStateHighlighted];
    
    CGFloat heightDifference = buttonImage.size.height - self.tabBar.frame.size.height;
    if (heightDifference < 0)
        centerItem.center = self.tabBar.center;
    else
    {
        CGPoint center = self.tabBar.center;
        center.y = center.y - heightDifference/2.0;
        centerItem.center = center;
    }
    [centerItem addTarget:self action:@selector(itemCenterAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:centerItem];
}

#pragma uit

-(void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item
{
    [self hideAllMenu];
}

#pragma button action
- (void) itemCenterAction
{
    [self hideAllMenu];
    AppDelegate *appdelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    [appdelegate.tabController setSelectedIndex:2];
    [appdelegate.tabController.viewControllers[2] popToRootViewControllerAnimated:YES];
    //NSLog(@"number vc %d",[appdelegate.tabController.viewControllers count]);
}


- (void) hideAllMenu{
    for (UINavigationController *view in self.viewControllers) {
        if ([view.viewControllers[0] isKindOfClass:[ViewControllerWithNavbar class]]) {
            ((ViewControllerWithNavbar*)view.viewControllers[0]).tableMenu.hidden = YES;
        }
    }
}


@end
