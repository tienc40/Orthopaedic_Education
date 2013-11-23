//
//  Z115CategoryListDataSource.h
//  Orthopaedic
//
//  Created by TienT on 11/23/13.
//  Copyright (c) 2013 TienT. All rights reserved.
//

#import "Z115DataSource.h"

typedef void (^Z115SuccessBlock)(void);
typedef void (^Z115FailureBlock)(NSError *error);

@class Z115WordPressCategory;
@class Z115CategoryListViewController;

@interface Z115CategoryListDataSource : Z115DataSource

@property (assign,nonatomic,getter=hasUpdates) BOOL updates;
@property (weak, nonatomic) Z115CategoryListViewController *categoryViewController;

- (void)fetchCategories;
- (void)loadCategoriesWithSuccess:(void (^)(void))success withFailure:(void (^)(NSError *error))failure;
- (void)addCategory:(Z115WordPressCategory *)category;


@end
