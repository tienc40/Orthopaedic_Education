//
//  Z115PostViewController.m
//  Orthopaedic
//
//  Created by TienT on 11/16/13.
//  Copyright (c) 2013 TienT. All rights reserved.
//

#import "NSString+HTML.h"
#import "UIView+Z115WordPress.h"

#import "Z115PostViewController.h"
#import "Z115WebViewController.h"
#import "Z115PostListViewController.h"
#import "NetworkPhotoAlbumViewController.h"

#import "Z115PostListDataSource.h"

#import "Z115WordPressPost.h"
#import "Z115WordPressPostAuthor.h"
#import "Z115WordPressCategory.h"
#import "Z115WordPressTag.h"

@interface Z115PostViewController ()

@property (nonatomic, strong) NSString *postId;
@property (nonatomic, strong) NSURL *postUrl;
@property (nonatomic, strong) UIScrollView *scrollView;

@property (strong, nonatomic) UILabel *previousTitleLabel;
@property (strong, nonatomic) UILabel *nextTitleLabel;

@property (assign, nonatomic) CGFloat fontSize;

@property (strong, nonatomic) UIBarButtonItem *makeCommentButton;

@property (nonatomic, strong) UIWebView *nextWebView;
@property (nonatomic, strong) UIWebView *previousWebView;
@end

@implementation Z115PostViewController



@end

