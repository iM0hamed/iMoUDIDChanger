//
//  iMoUDIDChanger.m
//  iMoUDIDChanger
//
//  Created by iMokhles on 11/03/16.
//  Copyright © 2016 iMokhles. All rights reserved.
//

#import "iMoUDIDChanger.h"
#import <Opee/Opee.h>
#import <mach-o/dyld.h>
#import "MobileDevice.h"


static NSString *deviceName;
static NSString *origUDIDPrefs;
static NSString *newUDID;


/* CAUSED CRASH */

//CFStringRef _AMDeviceCopyValue(AMDeviceRef device, CFStringRef domain, CFStringRef valueName);
//CFStringRef (*O_AMDeviceCopyValue)(AMDeviceRef device, CFStringRef domain, CFStringRef valueName);
//CFStringRef $_AMDeviceCopyValue(AMDeviceRef device, CFStringRef domain, CFStringRef valueName) {
//    
//    NSString *result = (__bridge NSString *)AMDeviceCopyValue(device,(CFStringRef)domain,(CFStringRef)@"DeviceName");
//    
//    if ([result isEqualToString:@"iMoPod4G"]) {
//        NSLog(@"iMoUDIDChanger %@", result);
////        if (CFEqual(valueName, CFSTR("UniqueDeviceID"))) {
////            return CFSTR("6ce8f33e8e8503cb0d32b4026791d69c333d3bc3");
////        }
//    }
//    return O_AMDeviceCopyValue(device, domain, valueName);
//}
CFStringRef _AMDeviceCopyDeviceIdentifier(AMDeviceRef device);
CFStringRef (*O_AMDeviceCopyDeviceIdentifier)(AMDeviceRef device);

CFStringRef $_AMDeviceCopyDeviceIdentifier(AMDeviceRef device) {
    
    NSString *origUDID = (NSString *)CFBridgingRelease(O_AMDeviceCopyDeviceIdentifier(device));
    if ([origUDID isEqualToString:origUDIDPrefs] && origUDIDPrefs.length > 1 && ![origUDIDPrefs isEqualToString:@""]) {
        NSLog(@"********* %@", deviceName);
        if (newUDID) {
            NSLog(@"********* UDID: %@", newUDID);
            return (CFStringRef)CFBridgingRetain(newUDID);
        }
        
    } else {
        NSLog(@"********* OTHER DEVICE OR NO SETTINGS");
        return (CFStringRef)CFBridgingRetain(origUDID);
    }
    return (CFStringRef)CFBridgingRetain(origUDID);
}

#pragma mark - Initialize
OPInitialize {
    NSUserDefaults *defaults = [[NSUserDefaults alloc] init];
    [defaults addSuiteNamed:@"com.imokhles.iMoUDIDChangerApp"];
    origUDIDPrefs = [defaults objectForKey:@"origUDID"];
    newUDID = [defaults objectForKey:@"newUDID"];
    deviceName = [defaults objectForKey:@"deviceName"];
    
    NSLog(@"iMoUDIDChanger Loaded");
    OPHookFunctionPtr(AMDeviceCopyDeviceIdentifier, $_AMDeviceCopyDeviceIdentifier, (void **)&O_AMDeviceCopyDeviceIdentifier);
//    OPHookFunctionPtr(AMDeviceCopyValue, $_AMDeviceCopyValue, (void **)&O_AMDeviceCopyValue);

}