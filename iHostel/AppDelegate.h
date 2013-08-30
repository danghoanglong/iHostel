//
//  AppDelegate.h
//  iHostel
//
//  Created by long.dang on 8/26/13.
//  Copyright (c) 2013 DHL. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SlideNavigationController.h"
#import "HomeViewController.h"
#import "ListMemberViewController.h"
#import "ReceiptManagementViewController.h"
#import "ReportManagementViewController.h"
#import "HostelSettingViewController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>
{
    HomeViewController *homeViewController;
    ListMemberViewController *listMemberViewController;
    ReceiptManagementViewController *receiptManagementViewController;
    ReportManagementViewController *reportManagementViewController;
    HostelSettingViewController *hostelSettingViewController;
}

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) SlideNavigationController *navigationController;
@property (assign, nonatomic) int currentPage;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)showAlertWithTitle:(NSString *)title Message:(NSString *)message andDelegate:(id)delegate;
- (void)showController:(int)index;
- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

@end
