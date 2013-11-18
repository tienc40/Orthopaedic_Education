//
//  mainNav.m
//  Orthopaedic
//
//  Created by Kiennd on 11/16/13.
//  Copyright (c) 2013 TienT. All rights reserved.
//

#import "MainNav.h"

@interface MainNav ()

@end

@implementation MainNav

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
       
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    NSLog(@"Loaded Cool");
//    [[UINavigationBar appearance] setBarTintColor:[UIColor yellowColor]];
    [[UINavigationBar appearance] setBackgroundImage:[UIImage imageNamed:@"mainnavbg.png"] forBarMetrics:UIBarMetricsDefault];
    
//    // font
    NSShadow *shadow = [[NSShadow alloc] init];
    shadow.shadowColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.8];
    shadow.shadowOffset = CGSizeMake(0, 1);
    UIFont* titleFont = [UIFont fontWithName:@"PT Sans" size:17];

    [[UINavigationBar appearance] setTitleTextAttributes: [NSDictionary dictionaryWithObjectsAndKeys:[UIColor colorWithRed:245.0/255.0 green:245.0/255.0 blue:245.0/255.0 alpha:1.0], NSForegroundColorAttributeName,shadow, NSShadowAttributeName,titleFont, NSFontAttributeName, nil]];
    

    // image title
//    
//    self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"mainnavtitle.png"]];

}

- (void) viewWillAppear:(BOOL)animated
{
    // add bar button

    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
