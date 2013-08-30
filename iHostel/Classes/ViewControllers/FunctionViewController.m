//
//  FunctionViewController.m
//  iHostel
//
//  Created by long.dang on 8/28/13.
//  Copyright (c) 2013 DHL. All rights reserved.
//

#import "FunctionViewController.h"
#import "Define.h"
#import "HomeViewController.h"
#import "ListMemberViewController.h"

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
    [self setSelected: mainAppDelegate.currentPage];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [self setManageMemberButton:nil];
    [self setHomeButton:nil];
    [self setManageReceiptButton:nil];
    [self setManageReportButton:nil];
    [self setSettingButton:nil];
    [super viewDidUnload];
}

#pragma mark Methods
- (void)setSelected:(int)index
{
    [self.homeButton setSelected:NO];
    [self.settingButton setSelected:NO];
    [self.manageReportButton setSelected:NO];
    [self.manageReceiptButton setSelected:NO];
    [self.manageMemberButton setSelected:NO];
    
    switch (index) {
        case kHomeController:
            [self.homeButton setSelected:YES];
            break;
        case kListMemberController:
            [self.manageMemberButton setSelected:YES];
            break;
        case kReceiptManagementController:
            [self.manageReceiptButton setSelected:YES];
            break;
        case kReportManagementController:
            [self.manageReportButton setSelected:YES];
            break;
        case kSettingController:
            [self.settingButton setSelected:YES];
            break;
        default:
            [self.homeButton setSelected:YES];
            break;
    }
}

- (void)showController:(int)index
{
    if (mainAppDelegate.currentPage != index)
    {
        mainAppDelegate.currentPage = index;
        [mainAppDelegate showController:index];
        [self setSelected:index];
    }
}

#pragma mark Events
- (IBAction)manageMemberButtonPressed:(id)sender
{
    [self showController:kListMemberController];
}

- (IBAction)manageHomeButtonPressed:(id)sender
{
    [self showController:kHomeController];
}

- (IBAction)manageReceiptButtonPressed:(id)sender
{
    [self showController:kReceiptManagementController];
}

- (IBAction)manageReportButtonPressed:(id)sender
{
    [self showController:kReportManagementController];
}

- (IBAction)manageSettingButtonPressed:(id)sender
{
    [self showController:kSettingController];
}
@end
