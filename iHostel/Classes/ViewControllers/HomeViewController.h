//
//  HomeViewController.h
//  iHostel
//
//  Created by long.dang on 8/28/13.
//  Copyright (c) 2013 DHL. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SlideNavigationController.h"

@interface HomeViewController : UIViewController <UIScrollViewDelegate, SlideNavigationControllerDelegate>

@property (strong, nonatomic) IBOutlet UILabel *hostelName;
@property (strong, nonatomic) IBOutlet UIButton *slideOutButton;

- (IBAction)slideOutButtonPressed:(id)sender;
@end
