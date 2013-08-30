//
//  ListMemberViewController.m
//  iHostel
//
//  Created by long.dang on 8/30/13.
//  Copyright (c) 2013 DHL. All rights reserved.
//

#import "ListMemberViewController.h"
#import "Define.h"
#import "MemberCell.h"

@interface ListMemberViewController ()

@end

@implementation ListMemberViewController

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

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark Initial
- (void)setUpView
{
    mainAppDelegate.currentPage = kListMemberController;
}

#pragma mark Events
- (IBAction)slideOutButtonPressed:(id)sender
{
    [mainAppDelegate.navigationController performSelector:@selector(leftMenuSelected:) withObject:sender];
}

#pragma mark SlideNavigationController Delegate
- (BOOL)slideNavigationControllerShouldDisplayRightMenu
{
    return NO;
}

- (BOOL)slideNavigationControllerShouldDisplayLeftMenu
{
    return YES;
}

- (void)viewDidUnload {
    [self setMemberTableView:nil];
    [super viewDidUnload];
}

#pragma mark UITableView Delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *memberCellIdentifier = @"MemberCell";
    
    MemberCell *cell = (MemberCell *)[tableView dequeueReusableCellWithIdentifier:memberCellIdentifier];
    if (cell == nil)
    {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"MemberCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}
@end
