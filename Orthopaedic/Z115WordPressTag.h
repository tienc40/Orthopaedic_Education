//
//  Z115WordPressTag.h
//  Orthopaedic
//
//  Created by TienT on 11/15/13.
//  Copyright (c) 2013 TienT. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Z115WordPressTag : NSObject

@property (nonatomic, strong) NSString *descriptionText;
@property (nonatomic, strong) NSNumber *postCount;
@property (nonatomic, strong) NSString *slug;
@property (nonatomic, strong) NSNumber *z115WordPressTagId;
@property (nonatomic, strong) NSString *title;

+ (Z115WordPressTag *)instanceFromDictionary:(NSDictionary *)aDictionary;
- (void)setAttributesFromDictionary:(NSDictionary *)aDictionary;

@end
