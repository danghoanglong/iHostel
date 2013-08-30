//
//  ListMemberViewController.h
//  iHostel
//
//  Created by long.dang on 8/30/13.
//  Copyright (c) 2013 DHL. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SlideNavigationController.h"

@interface ListMemberViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, SlideNavigationControllerDelegate>

@property (strong, nonatomic) IBOutlet UITableView *memberTableView;

- (IBAction)slideOutButtonPressed:(id)sender;
@end
