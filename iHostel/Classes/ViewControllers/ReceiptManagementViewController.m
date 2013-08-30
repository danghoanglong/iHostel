//
//  ReceiptManagementViewController.m
//  iHostel
//
//  Created by long.dang on 8/30/13.
//  Copyright (c) 2013 DHL. All rights reserved.
//

#import "ReceiptManagementViewController.h"

@interface ReceiptManagementViewController ()

@end

@implementation ReceiptManagementViewController

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

#pragma mark Events
- (IBAction)slideOutButtonPressed:(id)sender
{
    [mainAppDelegate.navigationController performSelector:@selector(leftMenuSelected:) withObject:sender];
}

#pragma mark SlideNavigationController Delegate
- (BOOL)slideNavigationControllerShouldDisplayLeftMenu
{
    return YES;
}

- (BOOL)slideNavigationControllerShouldDisplayRightMenu
{
    return NO;
}
@end
