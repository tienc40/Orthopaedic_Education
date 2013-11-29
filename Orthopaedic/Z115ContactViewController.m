//
//  Z115ContactViewController.m
//  Orthopaedic
//
//  Created by Kiennd on 11/28/13.
//  Copyright (c) 2013 TienT. All rights reserved.
//

#import "Z115ContactViewController.h"

@interface Z115ContactViewController ()
{
    int originY;
}
@property (weak, nonatomic) IBOutlet UITextField *txtName;
@property (weak, nonatomic) IBOutlet UITextField *txtEmail;
@property (weak, nonatomic) IBOutlet UITextView *txtEnquiry;
@property (weak, nonatomic) IBOutlet UIButton *btnSubmit;

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
    
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7)
    {
        self.edgesForExtendedLayout = UIRectEdgeNone;
        originY = 44;
    }

    // Do any additional setup after loading the view from its nib.
    UIButton* settingBtn = [[UIButton alloc]initWithFrame: CGRectMake(0, 0, MENU_WIDTH, 44.0f)];
    [settingBtn setImage:[UIImage imageNamed:@"settingnav.png"] forState:UIControlStateNormal];
    [settingBtn addTarget:self action:@selector(settingAction) forControlEvents:UIControlEventTouchUpInside];
    
    
    UIBarButtonItem *settingItem = [[UIBarButtonItem alloc] initWithCustomView:settingBtn];
    self.navigationItem.rightBarButtonItems = [NSArray arrayWithObjects:self.negativeSpacer,settingItem, nil];

    self.txtEnquiry.delegate  = self;
    self.txtEnquiry.enablesReturnKeyAutomatically = NO;
    
    self.txtEnquiry.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed: @"ta.png"]];
    
}
-(void)viewDidAppear:(BOOL)animated
{
    
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



-(BOOL)textViewShouldBeginEditing:(UITextView *)textView
{
    NSLog(@"begin");
    [self showKeyboard:textView];
    return YES;
}
- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range
 replacementText:(NSString *)text
{
    if ([text isEqualToString:@"\n"]) {
        [self dismissKeyboard:textView];
        return FALSE;
    }
    return TRUE;
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    NSLog(@"return");
    return YES;
}

-(void) dismissKeyboarda:(UIView*) view
{
    [view resignFirstResponder];
    
    [UIView animateWithDuration:0.4 animations:^{
        CGRect mainFrame = self.view.frame;
        self.view.frame = CGRectMake(mainFrame.origin.x, originY, mainFrame.size.height, mainFrame.size.width);
    }];
}

-(void) showKeyboard:(UIView*) view
{
    [UIView animateWithDuration:0.4 animations:^{
        CGRect mainFrame = self.view.frame;
        self.view.frame = CGRectMake(mainFrame.origin.x, originY-70, mainFrame.size.height, mainFrame.size.width);
    }];
}
- (IBAction)dismissKeyboard:(id)sender {
    [self dismissKeyboarda:sender];
}

@end
