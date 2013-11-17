//
//  Z115PostTableViewCell.h
//  Orthopaedic
//
//  Created by TienT on 11/16/13.
//  Copyright (c) 2013 TienT. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Z115WordPressPost;
@class Z115PostListViewController;

@interface Z115PostTableViewCell : UITableViewCell

@property (strong, nonatomic) NSDate * yesterday;
@property (weak, nonatomic) Z115PostListViewController *parentViewController;

- (void)showPost:(Z115WordPressPost *)post;

@end
