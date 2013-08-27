//
//  Define.h
//  iHostel
//
//  Created by long.dang on 8/27/13.
//  Copyright (c) 2013 DHL. All rights reserved.
//

#ifndef iHostel_Define_h
#define iHostel_Define_h

//----------------------------------------------------------------
#pragma mark Service

//----------------------------------------------------------------
#pragma mark Path

#define HOMEDIRECTORY [[NSBundle mainBundle] resourcePath]

#define DOCUMENTDIRECTORY [NSHomeDirectory() stringByAppendingString:@"/Documents/"]

#define LIBRARYCACHESDIRECTORY [NSHomeDirectory() stringByAppendingString:@"/Library/Caches/"]

//----------------------------------------------------------------
#pragma mark Device

#define ISIPHONE (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)

#define IS_WIDESCREEN ( fabs( ( double )[ [ UIScreen mainScreen ] bounds ].size.height - ( double )568 ) < DBL_EPSILON )

#define IS_IPHONE_5 ( ISIPHONE && IS_WIDESCREEN )

#define SCREEN_HEIGHT   [[UIScreen mainScreen] bounds].size.height

//----------------------------------------------------------------
#pragma mark Dimention
#define POTRAIT_KEYBOARD_HEIGHT 216

//----------------------------------------------------------------
#pragma mark String

//----------------------------------------------------------------
#pragma mark Key

#define kIsFirstRun                         @"isFirstRun"
#define kUsername                           @"Username"
#define kPassword                           @"Password"

#define kHostelName                         @"HostelName"
#define kHostelAddress                      @"HostelAddress"
#define kMasterName                         @"MasterName"
#define kMasterPhone                        @"MasterPhone"
#define kEnergyPrice                        @"EnergyPrice"
#define kWaterPrice                         @"WaterPrice"
#define kInternetPrice                      @"InternetPrice"


#pragma mark Message
#define mForgetUsername                     @"Bạn hãy nhập Tên đăng nhập"
#define mForgetPassword                     @"Bạn hãy nhập Mật khẩu"
#define mForgetConfirmPassword              @"Bạn hãy nhập Xác nhận mật khẩu"
#define mConfirmPasswordNotMatch            @"Xác nhận mật khẩu chưa đúng"
#define mAccountIsWrong                     @"Tài khoản hoặc Mật khẩu chưa đúng"

#define mForgetHostelName                   @"Bạn hãy nhập Tên phòng trọ"
#define mForgetHostelAddress                @"Bạn hãy nhập Địa chỉ phòng trọ"
#define mForgetMasterName                   @"Bạn hãy nhập Tên chủ nhà trọ"
#define mForgetMasterPhone                  @"Bạn hãy nhập Số điện thoại của Chủ nhà trọ"
#define mForgetEnergyPrice                  @"Bạn hãy nhập Giá điện"
#define mForgetWaterPrice                   @"Bạn hãy nhập Giá nước"
#define mForgetInternetPrice                @"Bạn hãy nhập Giá internet"

#endif
