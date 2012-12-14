#import "UIDevice+Hardware.h"

@implementation UIDevice(Hardware)
+ (NSString *)osVersion {
    return [UIDevice currentDevice].systemVersion;
}

+ (NSString *) deviceModel {
    int mib[2];
    size_t len;
    char *machine;
    
    mib[0] = CTL_HW;
    mib[1] = HW_MACHINE;
    sysctl(mib, 2, NULL, &len, NULL, 0);
    machine = malloc(len);
    sysctl(mib, 2, machine, &len, NULL, 0);
    
    NSString *platform = [NSString stringWithCString:machine encoding:NSASCIIStringEncoding];
    free(machine);
    return platform;
}

+ (NSString *) deviceName {
    NSString *platform = [UIDevice deviceModel];
    if ([platform isEqualToString:@"iPhone1,1"])    return @"iPhone 1G";
    if ([platform isEqualToString:@"iPhone1,2"])    return @"iPhone 3G";
    if ([platform isEqualToString:@"iPhone2,1"])    return @"iPhone 3GS";
    if ([platform isEqualToString:@"iPhone3,1"])    return @"iPhone 4";
    if ([platform isEqualToString:@"iPhone3,3"])    return @"Verizon iPhone 4";
    if ([platform isEqualToString:@"iPhone4,1"])    return @"iPhone 4S";
    if ([platform isEqualToString:@"iPhone5,1"])    return @"iPhone 5 (GSM)";
    if ([platform isEqualToString:@"iPhone5,2"])    return @"iPhone 5";
    if ([platform isEqualToString:@"iPod1,1"])      return @"iPod Touch 1G";
    if ([platform isEqualToString:@"iPod2,1"])      return @"iPod Touch 2G";
    if ([platform isEqualToString:@"iPod3,1"])      return @"iPod Touch 3G";
    if ([platform isEqualToString:@"iPod4,1"])      return @"iPod Touch 4G";
    if ([platform isEqualToString:@"iPod5,1"])      return @"iPod Touch 5G";
    if ([platform isEqualToString:@"iPad1,1"])      return @"iPad";
    if ([platform isEqualToString:@"iPad2,1"])      return @"iPad 2 (WiFi)";
    if ([platform isEqualToString:@"iPad2,2"])      return @"iPad 2 (GSM)";
    if ([platform isEqualToString:@"iPad2,3"])      return @"iPad 2 (CDMA)";
    if ([platform isEqualToString:@"iPad2,4"])      return @"iPad 2";
    if ([platform isEqualToString:@"iPad2,5"])      return @"iPad Mini";
    if ([platform isEqualToString:@"iPad2,6"])      return @"iPad Mini (WiFi)";
    if ([platform isEqualToString:@"iPad2,7"])      return @"iPad Mini (GSM)";
    if ([platform isEqualToString:@"iPad3,1"])      return @"iPad-3G (WiFi)";
    if ([platform isEqualToString:@"iPad3,2"])      return @"iPad-3G (4G)";
    if ([platform isEqualToString:@"iPad3,3"])      return @"iPad-3G (4G)";
    if ([platform isEqualToString:@"i386"])         return @"Simulator";
    if ([platform isEqualToString:@"x86_64"])       return @"Simulator";
    return platform;
}

+ (BOOL)isRetinaDisplay {
    NSString *platform = [UIDevice deviceModel];
    
    if ([platform isEqualToString:@"iPod4,1"]) return YES;
    if ([platform isEqualToString:@"iPod5,1"]) return YES;
    if ([platform isEqualToString:@"iPhone3,1"]) return YES;
    if ([platform isEqualToString:@"iPhone3,3"]) return YES;
    if ([platform isEqualToString:@"iPhone4,1"]) return YES;
    if ([platform isEqualToString:@"iPhone5,1"]) return YES;
    if ([platform isEqualToString:@"iPad3,1"]) return YES;
    if ([platform isEqualToString:@"iPad3,2"]) return YES;
    if ([platform isEqualToString:@"iPad3,3"]) return YES;
    
    return NO;
}

+ (BOOL)isMultitasking {
    if ([self respondsToSelector:@selector(isMultitaskingSupported)]) {
        return [UIDevice currentDevice].isMultitaskingSupported;
    }
    else {
      return NO;
    }
}

+ (BOOL)hasCamera {
    BOOL ret = NO;
    // check camera availability
    return ret;
}

@end
