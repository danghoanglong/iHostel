//
//  HomeViewController.m
//  iHostel
//
//  Created by long.dang on 8/28/13.
//  Copyright (c) 2013 DHL. All rights reserved.
//

#import "HomeViewController.h"
#import "GlobalObjects.h"
#import "Define.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

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
    [self setUpView];
}

- (void)viewDidAppear:(BOOL)animated
{
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [self setHostelName:nil];
    [self setSlideOutButton:nil];
    [super viewDidUnload];
}

#pragma mark Initials
- (void)setUpView
{
    self.hostelName.text = [[GlobalObjects sharedInstance].userDefaults objectForKey:kHostelName];
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
