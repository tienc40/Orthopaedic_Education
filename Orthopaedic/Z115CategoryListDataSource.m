//
//  Z115CategoryListDataSource.m
//  Orthopaedic
//
//  Created by TienT on 11/23/13.
//  Copyright (c) 2013 TienT. All rights reserved.
//

#import "Z115CategoryListDataSource.h"
#import "Z115WordPressCategory.h"
#import "Z115CategoryTableViewCell.h"

@interface Z115CategoryListDataSource()
@property (strong, nonatomic) NSDictionary *params;
@property (assign, nonatomic) NSInteger categoryTotal;
@property (strong, nonatomic) NSDictionary *categoryIds;
@end


@implementation Z115CategoryListDataSource

- (id)init
{
    self = [super init];
    
    if (self)
    {
        [self reset];
    }
    
    return self;
}

- (void) fetchCategories
{
    self.params = @{@"json" : @"get_category_index"};
}

- (void)loadCategoriesWithSuccess:(void (^)(void))success withFailure:(void (^)(NSError *error))failure
{
    [self cancel];
    
    self.loading = YES;
    
    NSMutableDictionary *fetchParams  = self.params.mutableCopy;
    
    __block Z115CategoryListDataSource *blockSelf = self;
    [[Z115WordPressAPIClient sharedClient] getPath:@""
                                        parameters:fetchParams
                                           success:^(AFHTTPRequestOperation *operation, id JSON) {
                                               
                                               
                                               for (NSDictionary *attributes in JSON[@"categories"])
                                               {
                                                   Z115WordPressCategory *category = [Z115WordPressCategory instanceFromDictionary:attributes];
                                                   
                                                   [blockSelf addCategory:category];
                                               }
                                               
                                               
                                               blockSelf.categoryTotal = (JSON[@"count"]) ? [JSON[@"count"] intValue] : [JSON[@"category_count"] intValue];
                                               
                                               
                                               if (success)
                                               {
                                                   success();
                                               }
                                               
                                               blockSelf.loading = NO;
                                               
                                           } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                                               NSLog(@"!!!Failure: %@", error);
                                               
                                               blockSelf.loading = NO;
                                               
                                               if (failure)
                                               {
                                                   failure(error);
                                               }
                                           }];
}


- (void)addCategory:(Z115WordPressCategory *)category
{
    if (!self.categoryIds[category.z115WordPressCategoryId])
    {
        NSMutableArray *categories = self.items.mutableCopy;
        [categories addObject:category];
        
        self.items = categories;
        
        NSMutableDictionary *ids = self.categoryIds.mutableCopy;
        ids[category.z115WordPressCategoryId] = [NSNumber numberWithInt:([self.items count] - 1)];
        
        self.categoryIds = ids;
        self.updates = YES;
    }
    else
    {
        NSMutableArray *categories = self.items.mutableCopy;
        [categories replaceObjectAtIndex:[self.categoryIds[category.z115WordPressCategoryId] intValue] withObject:category];
        self.items = categories;
    }
}

- (void)cancel
{
    [[Z115WordPressAPIClient sharedClient] cancelAllHTTPOperationsWithMethod:@"GET" path:@""];
}

- (void)reset
{
    self.categoryTotal = 0;
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.items count] + 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    Z115CategoryTableViewCell *cell = [[Z115CategoryTableViewCell alloc] init];
    if(indexPath.row == 0) {
        cell.textLabel.text = @"Latest Posts";
        cell.imageView.image = [UIImage imageNamed:@"row2.png"];
    } else {
        Z115WordPressCategory *category = [self.items objectAtIndex:(indexPath.row - 1)];
        cell.textLabel.text = category.title;
        cell.imageView.image = [UIImage imageNamed:@"row1.png"];
        cell.category = category;
    }
    
    return cell;
}


@end
