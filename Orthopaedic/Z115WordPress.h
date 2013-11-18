//
//  Z115WordPress.h
//  Orthopaedic
//
//  Created by TienT on 11/17/13.
//  Copyright (c) 2013 TienT. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Z115WordPress : NSObject
@property (assign, nonatomic) BOOL fullScreen;
+ (Z115WordPress *)sharedInstance;
@end
