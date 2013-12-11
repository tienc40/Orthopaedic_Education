//
//  Z115StarButton.h
//  Orthopaedic
//
//  Created by TienT on 11/29/13.
//  Copyright (c) 2013 TienT. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Z115WordPressPost;

@interface Z115StarButton : UIButton

- (BOOL)switchStar;
- (void)switchOn;
- (void)switchOff;

- (void)savePost:(Z115WordPressPost *)post;
- (void)deletePost:(Z115WordPressPost *)post;

@end



