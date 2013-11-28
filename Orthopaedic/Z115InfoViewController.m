//
//  Z115InfoViewController.m
//  Orthopaedic
//
//  Created by TienT on 11/28/13.
//  Copyright (c) 2013 TienT. All rights reserved.
//

#import "Z115InfoViewController.h"

@interface Z115InfoViewController ()

@end

@implementation Z115InfoViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}
- (IBAction)contactButtonTapped:(id)sender {
    [self.tabBarController setSelectedIndex:4];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
