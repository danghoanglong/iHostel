//
//  FunctionViewController.h
//  iHostel
//
//  Created by long.dang on 8/28/13.
//  Copyright (c) 2013 DHL. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FunctionViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIButton *manageMemberButton;
@property (strong, nonatomic) IBOutlet UIButton *homeButton;
@property (strong, nonatomic) IBOutlet UIButton *manageReceiptButton;
@property (strong, nonatomic) IBOutlet UIButton *manageReportButton;
@property (strong, nonatomic) IBOutlet UIButton *settingButton;

- (IBAction)manageMemberButtonPressed:(id)sender;
- (IBAction)manageHomeButtonPressed:(id)sender;
- (IBAction)manageReceiptButtonPressed:(id)sender;
- (IBAction)manageReportButtonPressed:(id)sender;
- (IBAction)manageSettingButtonPressed:(id)sender;
@end
