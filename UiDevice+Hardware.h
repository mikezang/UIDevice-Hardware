#include <sys/types.h>
#include <sys/sysctl.h>

@interface UIDevice(Hardware)

+ (NSString *) osVersion;
+ (NSString *) deviceModel;
+ (NSString *) deviceName;

+ (BOOL)isRetinaDisplay;
+ (BOOL)isMultitasking;
+ (BOOL)hasCamera;

@end
