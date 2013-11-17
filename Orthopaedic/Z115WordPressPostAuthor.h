//
//  Z115WordpressPostAuthor.h
//  Orthopaedic
//
//  Created by TienT on 11/15/13.
//  Copyright (c) 2013 TienT. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Z115WordPressPostAuthor : NSObject

@property (nonatomic, strong) NSString *descriptionText;
@property (nonatomic, strong) NSString *firstName;
@property (nonatomic, strong) NSString *lastName;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *nickname;
@property (nonatomic, strong) NSNumber *z115WordPressPostAuthorId;
@property (nonatomic, strong) NSString *slug;
@property (nonatomic, strong) NSString *url;

+ (Z115WordPressPostAuthor *)instanceFromDictionary:(NSDictionary *)aDictionary;
- (void)setAttributesFromDictionary:(NSDictionary *)aDictionary;

@end
