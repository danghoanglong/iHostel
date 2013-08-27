//
//  HostelSettingViewController.h
//  iHostel
//
//  Created by long.dang on 8/27/13.
//  Copyright (c) 2013 DHL. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HostelSettingViewController : UIViewController <UITextFieldDelegate>

@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;
@property (strong, nonatomic) IBOutlet UIView *contentView;
@property (strong, nonatomic) IBOutlet UITextField *hostelNameTextField;
@property (strong, nonatomic) IBOutlet UITextField *hostelAddressTextField;
@property (strong, nonatomic) IBOutlet UITextField *masterNameTextField;
@property (strong, nonatomic) IBOutlet UITextField *masterPhoneTextField;
@property (strong, nonatomic) IBOutlet UITextField *energyPriceTextField;
@property (strong, nonatomic) IBOutlet UITextField *wasterPriceTextField;
@property (strong, nonatomic) IBOutlet UITextField *internetPriceTextField;
@property (strong, nonatomic) IBOutlet UIButton *saveButton;
@property (strong, nonatomic) IBOutlet UIButton *backButton;

- (IBAction)saveButtonPressed:(id)sender;
- (IBAction)backButtonPressed:(id)sender;
@end
