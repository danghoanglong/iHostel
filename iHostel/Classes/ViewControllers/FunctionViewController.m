//
//  FunctionViewController.m
//  iHostel
//
//  Created by long.dang on 8/28/13.
//  Copyright (c) 2013 DHL. All rights reserved.
//

#import "FunctionViewController.h"
#import "Define.h"

@interface FunctionViewController ()

@end

@implementation FunctionViewController

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
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [self setManageMemberButton:nil];
    [super viewDidUnload];
}

#pragma mark Events
- (IBAction)manageMemberButtonPressed:(id)sender
{
    [_delegate actionWithKey:kActionMember];
}

- (IBAction)manageHomeButtonPressed:(id)sender
{
    [_delegate actionWithKey:kActionHome];
}

- (IBAction)manageReceiptButtonPressed:(id)sender
{
    [_delegate actionWithKey:kActionReceipt];
}

- (IBAction)manageReportButtonPressed:(id)sender
{
    [_delegate actionWithKey:kActionReport];
}

- (IBAction)manageSettingButtonPressed:(id)sender
{
    [_delegate actionWithKey:kActionSetting];
}
@end
