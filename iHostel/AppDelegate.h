//
//  AppDelegate.h
//  iHostel
//
//  Created by long.dang on 8/26/13.
//  Copyright (c) 2013 DHL. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) UINavigationController *navigationController;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)showAlertWithTitle:(NSString *)title Message:(NSString *)message andDelegate:(id)delegate;
- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

@end
