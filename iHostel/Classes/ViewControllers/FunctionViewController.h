//
//  FunctionViewController.h
//  iHostel
//
//  Created by long.dang on 8/28/13.
//  Copyright (c) 2013 DHL. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol FunctionViewControllerDelegate <NSObject>

@optional
- (void)actionWithKey:(int)key;

@required
//- (void)animalSelected:(Animal *)animal;

@end

@interface FunctionViewController : UIViewController

@property (nonatomic, assign) id<FunctionViewControllerDelegate> delegate;
@property (strong, nonatomic) IBOutlet UIButton *manageMemberButton;

- (IBAction)manageMemberButtonPressed:(id)sender;
- (IBAction)manageHomeButtonPressed:(id)sender;
- (IBAction)manageReceiptButtonPressed:(id)sender;
- (IBAction)manageReportButtonPressed:(id)sender;
- (IBAction)manageSettingButtonPressed:(id)sender;
@end
