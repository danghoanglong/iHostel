//
//  GlobalObjects.m
//  iHostel
//
//  Created by long.dang on 8/27/13.
//  Copyright (c) 2013 DHL. All rights reserved.
//

#import "GlobalObjects.h"
#import "Define.h"

@implementation GlobalObjects
@synthesize userDefaults = _userDefaults;

+ (GlobalObjects *)sharedInstance
{
    //the instance of this class is stored here
    static GlobalObjects *myInstance = nil;
    //check to see if an instance already exists
    
    if (nil == myInstance)
    {
        myInstance = [[[self class] alloc]init];
        myInstance.userDefaults = [NSUserDefaults standardUserDefaults];
    }
    
    return myInstance;
}
@end
