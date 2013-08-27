//
//  GlobalObjects.h
//  iHostel
//
//  Created by long.dang on 8/27/13.
//  Copyright (c) 2013 DHL. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GlobalObjects : NSObject
{
    NSUserDefaults *_userDefaults;
}

@property (nonatomic, strong) NSUserDefaults *userDefaults;

+ (GlobalObjects *)sharedInstance;
@end
