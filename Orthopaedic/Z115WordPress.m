//
//  Z115WordPress.m
//  Orthopaedic
//
//  Created by TienT on 11/17/13.
//  Copyright (c) 2013 TienT. All rights reserved.
//

#import "Z115WordPress.h"

@implementation Z115WordPress
+ (Z115WordPress *)sharedInstance {
    static Z115WordPress *_sharedClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedClient = [[Z115WordPress alloc] init];
    });
    
    return _sharedClient;
}

@end
