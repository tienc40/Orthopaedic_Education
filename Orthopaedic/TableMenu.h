//
//  TableMenu.h
//  Orthopaedic
//
//  Created by Kiennd on 11/17/13.
//  Copyright (c) 2013 TienT. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol TableMenuDelegate;

@interface TableMenu : UIView <UITableViewDelegate,UITableViewDataSource>
@property (strong) UITableView *categoryMenu;
@property (assign,nonatomic) id<TableMenuDelegate> menuDelegate;

@end


@protocol TableMenuDelegate
@required
- (void) didSelectItem:(int) rowIndex;

@end
