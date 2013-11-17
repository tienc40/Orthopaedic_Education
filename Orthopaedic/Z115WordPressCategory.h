//
//  Z115WordpressCategory.h
//  Orthopaedic
//
//  Created by TienT on 11/15/13.
//  Copyright (c) 2013 TienT. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Z115WordPressCategory : NSObject

@property (nonatomic, strong) NSNumber *z115WordPressCategoryId;
@property (nonatomic, strong) NSString *descriptionText;
@property (nonatomic, strong) NSNumber *parent;
@property (nonatomic, strong) NSNumber *postCount;
@property (nonatomic, strong) NSString *slug;
@property (nonatomic, strong) NSString *title;

+ (Z115WordPressCategory *)instanceFromDictionary:(NSDictionary *)aDictionary;

- (void)setAttributesFromDictionary:(NSDictionary *)aDictionary;


@end
