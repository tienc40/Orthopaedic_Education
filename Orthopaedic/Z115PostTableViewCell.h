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
@class Z115StarButton;

@interface Z115PostTableViewCell : UITableViewCell

@property (weak, nonatomic) Z115PostListViewController *parentViewController;
@property (strong, nonatomic) NSDate * yesterday;

@property (weak, nonatomic) IBOutlet Z115StarButton *starButton;

- (void)showPost:(Z115WordPressPost *)post;

@end

