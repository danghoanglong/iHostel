//
//  MainViewController.h
//  iHostel
//
//  Created by long.dang on 8/28/13.
//  Copyright (c) 2013 DHL. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeViewController.h"
#import "FunctionViewController.h"
#import "AddMemberViewController.h"

@interface MainViewController : UIViewController <FunctionViewControllerDelegate, HomeViewControllerDelegate, UIGestureRecognizerDelegate>

@property (nonatomic, strong) HomeViewController *homeViewController;
@property (nonatomic, strong) AddMemberViewController *addMemberViewController;
@property (nonatomic, strong) FunctionViewController *functionViewController;
@property (nonatomic, assign) BOOL showingFunctionPanel;
@property (nonatomic, assign) BOOL showPanel;
@property (nonatomic, assign) CGPoint preVelocity;
@end
