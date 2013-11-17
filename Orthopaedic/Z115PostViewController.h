//
//  Z115PostViewController.h
//  Orthopaedic
//
//  Created by TienT on 11/16/13.
//  Copyright (c) 2013 TienT. All rights reserved.
//

#import "Z115ViewController.h"

@class Z115WordPressPost;
@class Z115PostListDataSource;

@interface Z115PostViewController : Z115ViewController <UIWebViewDelegate, UIScrollViewDelegate, UIGestureRecognizerDelegate>

@property (nonatomic, strong) Z115PostListDataSource* dataSource;
@property (nonatomic, strong) Z115WordPressPost *post;
@property (nonatomic, assign) NSInteger index;
@property (nonatomic, strong) UIView *loadPreviousView;
@property (nonatomic, strong) UIView *loadNextView;
@property (nonatomic, strong) UIWebView *webView;

- (id)initWithPost:(Z115WordPressPost *)post;
- (id)initWithPostUrl:(NSURL *)url;
- (id)initWithDataSource:(Z115PostListDataSource *)source withStartIndex:(NSInteger)index;
- (void)loadPost;

@end
