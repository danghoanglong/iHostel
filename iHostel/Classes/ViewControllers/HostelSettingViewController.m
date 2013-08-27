//
//  HostelSettingViewController.m
//  iHostel
//
//  Created by long.dang on 8/27/13.
//  Copyright (c) 2013 DHL. All rights reserved.
//

#import "HostelSettingViewController.h"
#import "Define.h"
#import "GlobalObjects.h"

@interface HostelSettingViewController ()
{
    UITextField *currentTextField;
}
@end

@implementation HostelSettingViewController

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
    [self.scrollView setContentSize:self.contentView.frame.size];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillShow:)
                                                 name:UIKeyboardWillShowNotification
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillHide:)
                                                 name:UIKeyboardWillHideNotification
                                               object:nil];
    
    if ([[GlobalObjects sharedInstance].userDefaults boolForKey:kIsFirstRun] == NO)
    {
        [self.backButton setHidden:YES];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UIKeyboardWillShowNotification
                                                  object:nil];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UIKeyboardWillHideNotification
                                                  object:nil];
    
    [self setScrollView:nil];
    [self setContentView:nil];
    [self setHostelNameTextField:nil];
    [self setHostelAddressTextField:nil];
    [self setMasterNameTextField:nil];
    [self setMasterPhoneTextField:nil];
    [self setEnergyPriceTextField:nil];
    [self setWasterPriceTextField:nil];
    [self setInternetPriceTextField:nil];
    [self setSaveButton:nil];
    [self setBackButton:nil];
    [super viewDidUnload];
}

#pragma mark Events
- (IBAction)saveButtonPressed:(id)sender
{
    if ([self.hostelNameTextField.text isEqualToString:@""] == YES) {
        [mainAppDelegate showAlertWithTitle:nil Message:mForgetHostelName andDelegate:self];
        return;
    }
    if ([self.hostelAddressTextField.text isEqualToString:@""] == YES) {
        [mainAppDelegate showAlertWithTitle:nil Message:mForgetHostelAddress andDelegate:self];
        return;
    }
    if ([self.masterNameTextField.text isEqualToString:@""] == YES) {
        [mainAppDelegate showAlertWithTitle:nil Message:mForgetMasterName andDelegate:self];
        return;
    }
    if ([self.masterPhoneTextField.text isEqualToString:@""] == YES) {
        [mainAppDelegate showAlertWithTitle:nil Message:mForgetMasterPhone andDelegate:self];
        return;
    }
    if ([self.energyPriceTextField.text isEqualToString:@""] == YES) {
        [mainAppDelegate showAlertWithTitle:nil Message:mForgetEnergyPrice andDelegate:self];
        return;
    }
    if ([self.wasterPriceTextField.text isEqualToString:@""] == YES) {
        [mainAppDelegate showAlertWithTitle:nil Message:mForgetWaterPrice andDelegate:self];
        return;
    }
    if ([self.internetPriceTextField.text isEqualToString:@""] == YES) {
        [mainAppDelegate showAlertWithTitle:nil Message:mForgetInternetPrice andDelegate:self];
        return;
    }
    
    [[GlobalObjects sharedInstance].userDefaults setObject:self.hostelNameTextField.text forKey:kHostelName];
    [[GlobalObjects sharedInstance].userDefaults setObject:self.hostelAddressTextField.text forKey:kHostelAddress];
    [[GlobalObjects sharedInstance].userDefaults setObject:self.masterNameTextField.text forKey:kMasterName];
    [[GlobalObjects sharedInstance].userDefaults setObject:self.masterPhoneTextField forKey:kMasterPhone];
    [[GlobalObjects sharedInstance].userDefaults setObject:self.energyPriceTextField.text forKey:kEnergyPrice];
    [[GlobalObjects sharedInstance].userDefaults setObject:self.wasterPriceTextField.text forKey:kWaterPrice];
    [[GlobalObjects sharedInstance].userDefaults setObject:self.internetPriceTextField.text forKey:kInternetPrice];
    
    [mainAppDelegate showAlertWithTitle:nil Message:@"OK" andDelegate:self];
}

- (IBAction)backButtonPressed:(id)sender
{
    [mainAppDelegate.navigationController popViewControllerAnimated:YES];
}

#pragma mark UITextField Delegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    return [textField resignFirstResponder];
}

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    currentTextField = textField;
}

#pragma mark UIKeyboard Delegate
- (void)keyboardWillShow:(NSNotification*)notification
{
    CGRect frame = self.scrollView.frame;
    frame.size.height -= POTRAIT_KEYBOARD_HEIGHT;
    [self.scrollView setFrame:frame];
    CGRect rect = currentTextField.frame;
    rect.origin.y = currentTextField.tag * 50 + 100;
    [self.scrollView scrollRectToVisible:rect animated:YES];
}

- (void)keyboardWillHide:(NSNotification*)notification
{
    CGRect frame = self.scrollView.frame;
    if (frame.size.height + POTRAIT_KEYBOARD_HEIGHT < 568) {
        frame.size.height += POTRAIT_KEYBOARD_HEIGHT;
    }
    
    [self.scrollView setFrame:frame];
}
@end
