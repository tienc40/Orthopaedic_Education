//
//  Z115Post.h
//  Pods
//
//  Created by TienT on 12/3/13.
//
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@interface Z115Post : NSManagedObject

@property (nonatomic, retain) NSString * author;
@property (nonatomic, retain) NSString * content;
@property (nonatomic, retain) NSDate * date;
@property (nonatomic, retain) NSString * excerpt;
@property (nonatomic, retain) NSString * modified;
@property (nonatomic, retain) NSDate * postDate;
@property (nonatomic, retain) NSString * postHtml;
@property (nonatomic, retain) NSString * slug;
@property (nonatomic, retain) NSString * status;
@property (nonatomic, retain) NSString * thumbnail;
@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) NSString * titlePlain;
@property (nonatomic, retain) NSNumber * z115WordPressPostId;

@end
