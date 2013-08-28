//
//  HomeViewController.h
//  iHostel
//
//  Created by long.dang on 8/28/13.
//  Copyright (c) 2013 DHL. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FunctionViewController.h"

@protocol HomeViewControllerDelegate <NSObject>

@optional
- (void)movePanelRight;

@required
- (void)movePanelToOriginalPosition;

@end

@interface HomeViewController : UIViewController <UIScrollViewDelegate>

@property (nonatomic, assign) id<HomeViewControllerDelegate> delegate;
@property (strong, nonatomic) IBOutlet UILabel *hostelName;
@property (strong, nonatomic) IBOutlet UIButton *slideOutButton;

- (IBAction)slideOutButtonPressed:(id)sender;
@end
