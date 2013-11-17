//
//  Z115DataSource.m
//  Orthopaedic
//
//  Created by TienT on 11/15/13.
//  Copyright (c) 2013 TienT. All rights reserved.
//

#import "Z115DataSource.h"

@implementation Z115DataSource

- (id)init
{
    self = [super init];
    if (self)
    {
        self.items = @[];
    }
    
    return self;
}

- (id)initWithSuccess:(void (^)(void))success withFailure:(void (^)(NSError *error))failure
{
    self = [self init];
    if (self)
    {
        
    }
    
    return self;
}

- (void)loadItems:(BOOL)more
{
    
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.items count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return nil;
}


@end
