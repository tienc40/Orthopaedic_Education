//
//  Z115DataSource.h
//  Orthopaedic
//
//  Created by TienT on 11/15/13.
//  Copyright (c) 2013 TienT. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Z115DataSource : NSObject <UITableViewDataSource>

@property (nonatomic, strong) NSArray *items;
@property (nonatomic, assign, getter=isLoading) BOOL loading;

- (id)initWithSuccess:(void (^)(void))success withFailure:(void (^)(NSError *error))failure;
- (void)loadItems:(BOOL)more;

@end
