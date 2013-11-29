//
//  Z115WordPressPost.h
//  Pods
//
//  Created by TienT on 11/29/13.
//
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Z115WordPressPost : NSManagedObject

@property (nonatomic, retain) NSNumber * z115WordPressPostId;
@property (nonatomic, retain) id attachments;
@property (nonatomic, retain) id categories;
@property (nonatomic, retain) NSNumber * commentCount;
@property (nonatomic, retain) id comments;
@property (nonatomic, retain) NSString * commentStatus;
@property (nonatomic, retain) NSString * content;
@property (nonatomic, retain) NSString * date;
@property (nonatomic, retain) NSDate * postDate;
@property (nonatomic, retain) NSString * excerpt;
@property (nonatomic, retain) NSString * modified;
@property (nonatomic, retain) NSString * slug;
@property (nonatomic, retain) NSString * status;
@property (nonatomic, retain) id tags;
@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) NSString * titlePlain;
@property (nonatomic, retain) NSString * type;
@property (nonatomic, retain) NSString * url;
@property (nonatomic, retain) NSString * thumbnail;
@property (nonatomic, retain) NSString * previousUrl;
@property (nonatomic, retain) NSString * nextUrl;
@property (nonatomic, retain) NSString * previousTitle;
@property (nonatomic, retain) NSString * nextTitle;
@property (nonatomic, retain) NSString * postHtml;

@end
