//
//  UIDevice+Hardware.h
//  ZnLog
//
//  Created by 박종현 on 2018. 6. 7..
//  Copyright © 2018년 Znfod. All rights reserved.
//

#import <UIKit/UIKit.h>

#define IFPGA_NAMESTRING                @"iFPGA"

#define IPHONE_1G_NAMESTRING            @"iPhone 1G"
#define IPHONE_3G_NAMESTRING            @"iPhone 3G"
#define IPHONE_3GS_NAMESTRING           @"iPhone 3GS"
#define IPHONE_4_NAMESTRING             @"iPhone 4"
#define IPHONE_4S_NAMESTRING            @"iPhone 4S"
#define IPHONE_5_NAMESTRING             @"iPhone 5"
#define IPHONE_5C_NAMESTRING            @"iPhone 5C"
#define IPHONE_5S_NAMESTRING            @"iPhone 5S"
#define IPHONE_6_NAMESTRING             @"iPhone 6"
#define IPHONE_6P_NAMESTRING            @"iPhone 6 Plus"
#define IPHONE_6S_NAMESTRING            @"iPhone 6S"
#define IPHONE_6SP_NAMESTRING           @"iPhone 6S Plus"
#define IPHONE_SE_NAMESTRING            @"iPhone SE"
#define IPHONE_7_NAMESTRING             @"iPhone 7"
#define IPHONE_7P_NAMESTRING            @"iPhone 7 Plus"
#define IPHONE_8_NAMESTRING             @"iPhone 8"
#define IPHONE_8P_NAMESTRING            @"iPhone 8 Plus"
#define IPHONE_X_NAMESTRING             @"iPhone X"
#define IPHONE_UNKNOWN_NAMESTRING       @"Unknown iPhone"

#define IPOD_1G_NAMESTRING              @"iPod touch 1G"
#define IPOD_2G_NAMESTRING              @"iPod touch 2G"
#define IPOD_3G_NAMESTRING              @"iPod touch 3G"
#define IPOD_4G_NAMESTRING              @"iPod touch 4G"
#define IPOD_5G_NAMESTRING              @"iPod touch 5G"
#define IPOD_6G_NAMESTRING              @"iPod touch 6G"
#define IPOD_UNKNOWN_NAMESTRING         @"Unknown iPod"

#define IPAD_1G_NAMESTRING              @"iPad 1G"
#define IPAD_2G_NAMESTRING              @"iPad 2G"
#define IPAD_3G_NAMESTRING              @"iPad 3G"
#define IPAD_4G_NAMESTRING              @"iPad 4G"
#define IPAD_5G_NAMESTRING              @"iPad 5G"
#define IPAD_6G_NAMESTRING              @"iPad 6G"
#define IPAD_A1_NAMESTRING              @"iPad Air 1"
#define IPAD_A2_NAMESTRING              @"iPad Air 2"
#define IPAD_M1_NAMESTRING              @"iPad Mini 1"
#define IPAD_M2_NAMESTRING              @"iPad Mini 2"
#define IPAD_M3_NAMESTRING              @"iPad Mini 3"
#define IPAD_M4_NAMESTRING              @"iPad Mini 4"
#define IPAD_9P_NAMESTRING              @"iPad Pro 9.7 Inch"
#define IPAD_12P1G_NAMESTRING           @"iPad Pro 12.9 Inch"
#define IPAD_12P2G_NAMESTRING           @"iPad Pro 12.9 Inch 2. Generation"
#define IPAD_10P_NAMESTRING             @"iPad Pro 10.5 Inch"

#define IPAD_UNKNOWN_NAMESTRING         @"Unknown iPad"

#define APPLETV_2G_NAMESTRING           @"Apple TV 2G"
#define APPLETV_3G_NAMESTRING           @"Apple TV 3G"
#define APPLETV_4G_NAMESTRING           @"Apple TV 4G"
#define APPLETV_5G_NAMESTRING           @"Apple TV"
#define APPLETV_6G_NAMESTRING           @"Apple TV 4K"
#define APPLETV_UNKNOWN_NAMESTRING      @"Unknown Apple TV"

#define HOMEPOD_1G_NAMESTRING           @"Apple HOMEPOD"

#define IOS_FAMILY_UNKNOWN_DEVICE       @"Unknown iOS device"

#define SIMULATOR_NAMESTRING            @"iPhone Simulator"
#define SIMULATOR_IPHONE_NAMESTRING     @"iPhone Simulator"
#define SIMULATOR_IPAD_NAMESTRING       @"iPad Simulator"
#define SIMULATOR_APPLETV_NAMESTRING    @"Apple TV Simulator" // :)

typedef enum {
    UIDeviceUnknown,
    
    UIDeviceSimulator,
    UIDeviceSimulatoriPhone,
    UIDeviceSimulatoriPad,
    UIDeviceSimulatorAppleTV,
    
    UIDevice1GiPhone,
    UIDevice3GiPhone,
    UIDevice3GSiPhone,
    UIDevice4iPhone,
    UIDevice4SiPhone,
    UIDevice5iPhone,
    UIDevice5CiPhone,
    UIDevice5SiPhone,
    UIDevice6iPhone,
    UIDevice6PiPhone,
    UIDevice6SiPhone,
    UIDevice6SPiPhone,
    UIDeviceSEiPhone,
    UIDevice7iPhone,
    UIDevice7PiPhone,
    UIDevice8iPhone,
    UIDevice8PiPhone,
    UIDeviceXiPhone,
    
    UIDevice1GiPod,
    UIDevice2GiPod,
    UIDevice3GiPod,
    UIDevice4GiPod,
    UIDevice5GiPod,
    UIDevice6GiPod,
    
    UIDevice1GiPad, //iPad 1
    UIDevice2GiPad, //iPad 2
    UIDevice3GiPad, //iPad 3
    UIDevice4GiPad, //iPad 4
    UIDevice5GiPad, //iPad 5
    UIDevice6GiPad, //iPad 6
    
    UIDeviceA1iPad, //iPad Air
    UIDeviceA2iPad, //iPad Air 2
    
    UIDeviceM1iPad, //iPad Mini 1
    UIDeviceM2iPad, //iPad Mini 2
    UIDeviceM3iPad, //iPad Mini 3
    UIDeviceM4iPad, //iPad Mini 4
    
    UIDevice9PiPad, //iPad Pro 9.7 Inch
    UIDevice12P1GiPad, //iPad Pro 12.9 Inch
    UIDevice12P2GiPad, //iPad Pro 12.9 Inch
    UIDevice10PiPad, //iPad Pro 10.5 Inch
    
    UIDeviceAppleTV2,
    UIDeviceAppleTV3,
    UIDeviceAppleTV4,
    UIDeviceAppleTV5,
    UIDeviceAppleTV6,
    
    UIDeviceHomePod,
    
    UIDeviceUnknowniPhone,
    UIDeviceUnknowniPod,
    UIDeviceUnknowniPad,
    UIDeviceUnknownAppleTV,
    UIDeviceIFPGA,
    
} UIDevicePlatform;

typedef enum {
    UIDeviceFamilyiPhone,
    UIDeviceFamilyiPod,
    UIDeviceFamilyiPad,
    UIDeviceFamilyAppleTV,
    UIDeviceFamilyUnknown,
    
} UIDeviceFamily;

@interface UIDevice (Hardware)
- (NSString *) platform;
- (NSString *) hwmodel;
- (NSUInteger) platformType;
- (NSString *) platformString;

- (NSUInteger) cpuFrequency;
- (NSUInteger) busFrequency;
- (NSUInteger) cpuCount;
- (NSUInteger) totalMemory;
- (NSUInteger) userMemory;

- (NSNumber *) totalDiskSpace;
- (NSNumber *) freeDiskSpace;

- (NSString *) macaddress;

- (BOOL) hasRetinaDisplay;
- (UIDeviceFamily) deviceFamily;
@end
