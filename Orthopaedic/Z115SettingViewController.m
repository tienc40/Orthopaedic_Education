//
//  Z115SettingViewController.m
//  Orthopaedic
//
//  Created by TienT on 12/11/13.
//  Copyright (c) 2013 TienT. All rights reserved.
//

#import "Z115SettingViewController.h"

@interface Z115SettingViewController ()

@end

@implementation Z115SettingViewController

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
    
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    
    // getting an NSInteger
    NSInteger arrowpos = [prefs integerForKey:@"arrowpos"];
    
    // getting an Float
    float fontsize = [prefs floatForKey:@"fontsize"];
    
    [self.fontSizeSlider setValue:fontsize];
    [self.arrowPositionSwitcher setOn:arrowpos];
    
}

- (IBAction)fontChange:(id)sender {
    NSLog(@"slider value = %f", [(UISlider *)sender value]);
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    [prefs setFloat:[(UISlider *)sender value] forKey:@"fontsize"];
    [prefs synchronize];
}

- (IBAction)arrowChange:(id)sender {
    BOOL state = [sender isOn];
    NSLog(@"arrow value = %d",state);
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    [prefs setInteger:[sender isOn] forKey:@"arrowpos"];
    [prefs synchronize];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
