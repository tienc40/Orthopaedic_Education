//
//  Z115WordPressAPIClient.m
//  Orthopaedic
//
//  Created by TienT on 11/15/13.
//  Copyright (c) 2013 TienT. All rights reserved.
//

#import "Z115WordPressAPIClient.h"
#import "AFJSONRequestOperation.h"
#import "Z115WordPressPost.h"
#import "Z115WordPressCategory.h"

static NSString * const z115WordpressURLString =  @"http://www.mobileappscentre.co.uk/healthapp/";

@implementation Z115WordPressAPIClient

+ (instancetype)sharedClient
{
    static Z115WordPressAPIClient *_sharedClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedClient = [[Z115WordPressAPIClient alloc] initWithBaseURL:[NSURL URLWithString:z115WordpressURLString]];
    });
    
    return _sharedClient;
}



- (instancetype)initWithBaseURL:(NSURL *)url
{
    self = [super initWithBaseURL:url];
    if (!self) {
        return nil;
    }
    
    [self registerHTTPOperationClass:[AFJSONRequestOperation class]];
    
    // Accept HTTP Header; see http://www.w3.org/Protocols/rfc2616/rfc2616-sec14.html#sec14.1
	[self setDefaultHeader:@"Accept" value:@"application/json"];
    
    return self;
}

- (void)loadFromPostId:(NSString *)postId
           withSuccess:(void (^)(Z115WordPressPost* post))success
           withFailure:(void (^)(NSError *error))failure
{
    return;
    
    [self getPath:@""
       parameters:@{@"json" : @"get_post", @"post_id" : postId}
          success:^(AFHTTPRequestOperation *operation, id JSON) {
              
              Z115WordPressPost *post = [Z115WordPressPost instanceFromDictionary:JSON[@"post"]];
              if (success)
              {
                  success(post);
              }
              
          } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
              if (failure)
              {
                  failure(error);
              }
          }];
    
}

- (void)loadFromPostUrl:(NSURL *)postUrl
            withSuccess:(void (^)(Z115WordPressPost* post))success
            withFailure:(void (^)(NSError *error))failure
{
    NSLog(@"[postUrl path]: %@", [postUrl path]);
    [self getPath:[postUrl path]
       parameters:@{@"json" : @"1"}
          success:^(AFHTTPRequestOperation *operation, id JSON) {
              NSLog(@"Json: %@", JSON);
              
              Z115WordPressPost *post = [Z115WordPressPost instanceFromDictionary:JSON[@"post"]];
              if (success)
              {
                  success(post);
              }
              
          } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
              if (failure)
              {
                  failure(error);
              }
          }];
    
}


- (void)loadFromCategoryUrl:(NSURL *)categoryUrl
            withSuccess:(void (^)(Z115WordPressCategory* category))success
            withFailure:(void (^)(NSError *error))failure
{
    NSLog(@"[categoryUrl path]: %@", [categoryUrl path]);
    [self getPath:[categoryUrl path]
       parameters:@{@"json" : @"1"}
          success:^(AFHTTPRequestOperation *operation, id JSON) {
              NSLog(@"Json: %@", JSON);
              
              Z115WordPressCategory *category = [Z115WordPressCategory instanceFromDictionary:JSON[@"category"]];
              if (success)
              {
                  success(category);
              }
              
          } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
              if (failure)
              {
                  failure(error);
              }
          }];
    
}


@end
