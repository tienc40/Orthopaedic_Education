//
//  TableMenu.m
//  Orthopaedic
//
//  Created by Kiennd on 11/17/13.
//  Copyright (c) 2013 TienT. All rights reserved.
//

#import "TableMenu.h"
#import "Z115CategoryListDataSource.h"
#import "UIColor+Z115WordPress.h"
#import "Z115CategoryTableViewCell.h"
#import "Z115WordPressCategory.h"

@implementation TableMenu
{
    NSArray *_menuContent;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.dataSource = [Z115CategoryListDataSource new];
        [self.dataSource fetchCategories];
        
        _menuContent = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"menu" ofType:@"plist"]];
        
        _categoryMenu = [[UITableView alloc] initWithFrame:self.frame];
        _categoryMenu.dataSource = self.dataSource;
        _categoryMenu.delegate = self;
        
        [self addSubview:_categoryMenu];
        
        [self loadCategories];

    }
    return self;
}

- (void)loadCategories
{
    //__block TableMenu *blockSelf = self;
    [self.dataSource loadCategoriesWithSuccess:^(){
                      [self finishedLoad];
                  }
                  withFailure:^(NSError *error){
                      //[self showError:error];
                      [self removeLoading];
                  }]; 
    
}

- (void)finishedLoad
{
    self.dataSource.updates = NO;
    [self.categoryMenu reloadData];
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
        
        
        [self addSubview:self.loadingView];
        [self bringSubviewToFront:self.loadingView];
    }
    
    
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


#pragma mark uitableview delegate

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)newIndexPath{
    Z115CategoryTableViewCell *cell = (Z115CategoryTableViewCell *)[tableView cellForRowAtIndexPath:newIndexPath];
    [self.menuDelegate didSelectItem:cell.category.z115WordPressCategoryId];
    //[tableView deselectRowAtIndexPath:newIndexPath animated:YES];
}

@end
