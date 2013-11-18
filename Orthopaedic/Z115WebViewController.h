//
//  Z115WebViewController.h
//  Orthopaedic
//
//  Created by TienT on 11/16/13.
//  Copyright (c) 2013 TienT. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "Z115ViewController.h"

@interface Z115WebViewController : Z115ViewController <UIWebViewDelegate, UIActionSheetDelegate>

- (id)initWithWebURL:(NSURLRequest *)request;

@end
