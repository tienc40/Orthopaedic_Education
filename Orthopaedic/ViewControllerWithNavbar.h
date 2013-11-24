//
//  ViewControllerWithNavbar.h
//  Orthopaedic
//
//  Created by Kiennd on 11/16/13.
//  Copyright (c) 2013 TienT. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TableMenu.h"
@interface ViewControllerWithNavbar : UIViewController <UINavigationControllerDelegate,TableMenuDelegate>

@property (strong, nonatomic) TableMenu* tableMenu;

-(void)setBackButton;
- (void)back;
@end
