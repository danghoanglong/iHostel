//
//  LoginViewController.m
//  iHostel
//
//  Created by long.dang on 8/26/13.
//  Copyright (c) 2013 DHL. All rights reserved.
//

#import "LoginViewController.h"
#import "Define.h"
#import "GlobalObjects.h"
#import "HostelSettingViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

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
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillShow:)
                                                 name:UIKeyboardWillShowNotification
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillHide:)
                                                 name:UIKeyboardWillHideNotification
                                               object:nil];
    
    [self.scrollView setContentSize:self.scrollView.frame.size];

    if ([[GlobalObjects sharedInstance].userDefaults boolForKey:kIsFirstRun] == NO)
    {
        CGRect frame = self.signInView.frame;
        frame.size.height += 50;
        self.signInView.frame = frame;
        
        frame = self.signInButton.frame;
        frame.origin.y += 50;
        self.signInButton.frame = frame;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload
{
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UIKeyboardWillShowNotification
                                                  object:nil];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UIKeyboardWillHideNotification
                                                  object:nil];
    
    self.scrollView = nil;
    self.signInView = nil;
    self.usernameTextField = nil;
    self.passwordTextField = nil;
    self.signInButton = nil;
    [self setConfirmPasswordTextField:nil];
    [super viewDidUnload];
}

#pragma mark Events
- (IBAction)signInButtonPressed:(id)sender
{
    if ([self.usernameTextField.text isEqualToString: @""] == YES) {
        [mainAppDelegate showAlertWithTitle:nil Message:mForgetUsername andDelegate:self];
        return;
    }
    
    if ([self.passwordTextField.text isEqualToString: @""] == YES) {
        [mainAppDelegate showAlertWithTitle:nil Message:mForgetPassword andDelegate:self];
        return;
    }
    
    if ([[GlobalObjects sharedInstance].userDefaults boolForKey:kIsFirstRun] == NO)
    {
        if ([self.confirmPasswordTextField.text isEqualToString: @""] == YES)
        {
            [mainAppDelegate showAlertWithTitle:nil Message:mForgetConfirmPassword andDelegate:self];
            return;
        }
        
        if ([self.passwordTextField.text isEqualToString: self.confirmPasswordTextField.text] == YES)
        {
            [[GlobalObjects sharedInstance].userDefaults setObject:[NSNumber numberWithBool:YES] forKey:kIsFirstRun];
            [[GlobalObjects sharedInstance].userDefaults setObject:self.usernameTextField.text forKey:kUsername];
            [[GlobalObjects sharedInstance].userDefaults setObject:self.passwordTextField.text forKey:kPassword];
            
            HostelSettingViewController *controller = [[HostelSettingViewController alloc] init];
            [mainAppDelegate.navigationController pushViewController: controller animated:YES];
            controller = nil;
        }
        else
        {
            [mainAppDelegate showAlertWithTitle:nil Message:mConfirmPasswordNotMatch andDelegate:self];
            return;
        }
    }
    else {
        NSString *user = [[GlobalObjects sharedInstance].userDefaults objectForKey:kUsername];
        NSString *pass = [[GlobalObjects sharedInstance].userDefaults objectForKey:kPassword];

        if ([self.usernameTextField.text isEqualToString:user] == YES &&
            [self.passwordTextField.text isEqualToString:pass] == YES)
        {
            HostelSettingViewController *controller = [[HostelSettingViewController alloc] init];
            [mainAppDelegate.navigationController pushViewController: controller animated:YES];
            controller = nil;
        }
        else
        {
            [mainAppDelegate showAlertWithTitle:nil Message:mAccountIsWrong andDelegate:self];
            return;
        }
    }
}

#pragma mark UITextField Delegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    return [textField resignFirstResponder];
}

#pragma mark UIKeyboard Delegate
- (void)keyboardWillShow:(NSNotification*)notification
{
    CGRect frame = self.scrollView.frame;
    frame.size.height -= POTRAIT_KEYBOARD_HEIGHT;
    [self.scrollView setFrame:frame];
    
    [self.scrollView scrollRectToVisible:self.signInView.frame animated:YES];
}

- (void)keyboardWillHide:(NSNotification*)notification
{
    CGRect frame = self.scrollView.frame;
    frame.size.height += POTRAIT_KEYBOARD_HEIGHT;
    [self.scrollView setFrame:frame];
}
@end
