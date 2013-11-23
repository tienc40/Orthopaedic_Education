//
//  TableMenu.h
//  Orthopaedic
//
//  Created by Kiennd on 11/17/13.
//  Copyright (c) 2013 TienT. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol TableMenuDelegate;
@class Z115CategoryListDataSource;

@interface TableMenu : UIView <UITableViewDelegate>
@property (strong) UITableView *categoryMenu;
@property (assign,nonatomic) id<TableMenuDelegate> menuDelegate;
@property (nonatomic, strong) Z115CategoryListDataSource *dataSource;
@property (nonatomic, strong) UIView *loadingView;

- (void)endRefresh;
- (void)loadCategories;
- (void)finishedLoad;

@end

@protocol TableMenuDelegate
@required
- (void) didSelectItem:(NSNumber *) rowIndex;
@end
