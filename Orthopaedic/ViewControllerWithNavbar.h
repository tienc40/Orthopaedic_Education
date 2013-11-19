//
//  ViewControllerWithNavbar.h
//  Orthopaedic
//
//  Created by Kiennd on 11/16/13.
//  Copyright (c) 2013 TienT. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TableMenu.h"
@interface ViewControllerWithNavbar : UIViewController <TableMenuDelegate,UINavigationControllerDelegate>
@property (strong) TableMenu* tableMenu;
-(void)setBackButton;
- (void)back;
@end
