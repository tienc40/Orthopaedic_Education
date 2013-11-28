//
//  Z115ContactViewController.m
//  Orthopaedic
//
//  Created by Kiennd on 11/28/13.
//  Copyright (c) 2013 TienT. All rights reserved.
//

#import "Z115ContactViewController.h"

@interface Z115ContactViewController ()

@end

@implementation Z115ContactViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [[super initWithCoder:aDecoder] initWithNibName:@"Z115ContactViewController" bundle:nil];
    if( self ) {
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    UIButton* settingBtn = [[UIButton alloc]initWithFrame: CGRectMake(0, 0, MENU_WIDTH, 44.0f)];
    [settingBtn setImage:[UIImage imageNamed:@"settingnav.png"] forState:UIControlStateNormal];
    [settingBtn addTarget:self action:@selector(settingAction) forControlEvents:UIControlEventTouchUpInside];
    
    
    UIBarButtonItem *settingItem = [[UIBarButtonItem alloc] initWithCustomView:settingBtn];
    self.navigationItem.rightBarButtonItems = [NSArray arrayWithObjects:self.negativeSpacer,settingItem, nil];


}

- (void) settingAction
{
    NSLog(@"setting action");
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
