//
//  TDPresetTemplate.m
//  DevelopProgram
//
//  Created by huangdiao on 2023/10/24.
//

#import "TDPresetTemplate.h"
//#if __has_include(<ThinkingSDK/ThinkingSDK.h>)
//#import <ThinkingSDK/ThinkingSDK.h>
//#import <ThinkingSDK/NSDate+TDFormat.h>
//#define TDAnalyticsAvailably 1
//#endif
//#if __has_include("ThinkingSDK.h")
//#import "ThinkingSDK.h"
//#import "NSDate+TDFormat.h"
//#define TDAnalyticsAvailably 1
//#endif


static NSString * const TD_NEW_DEVICE_EVENT = @"ta_new_device";
static NSString * const TD_REGISTER_EVENT   = @"ta_register";
static NSString * const TD_LOGIN_EVENT      = @"ta_login";
static NSString * const TD_LOGOUT_EVENT     = @"ta_logout";
static NSString * const TD_PAYMENT_EVENT    = @"ta_payment";

static NSString * const TD_CHANNEL              = @"channel";
static NSString * const TD_REGISTER_TIME        = @"register_time";
static NSString * const TD_REGISTER_ZONE_OFFSET = @"register_zone_offset";

@interface TDPresetTemplate ()

@end

static BOOL _enableAutoTrackManually = NO;

@implementation TDPresetTemplate

+ (void)trackRegister:(TDRegisterEventModel *)eventModel {
    if (eventModel != nil) {
        Class c_TDAnalytics = NSClassFromString(@"TDAnalytics");
        if (c_TDAnalytics == nil) NSLog(@"TDAnalytics SDK is not found, you need to import TDAnalytics SDK first.");
        SEL s_login = NSSelectorFromString(@"login:");
        SEL s_track = NSSelectorFromString(@"track:");
        SEL s_track_properties = NSSelectorFromString(@"track:properties:");
        SEL s_userSetOnce = NSSelectorFromString(@"userSetOnce:");
        if (eventModel.accountId != nil) {
            if ([c_TDAnalytics respondsToSelector:s_login]) {
                [c_TDAnalytics performSelector:s_login withObject:eventModel.accountId];
            }
        }
        if (eventModel.eventProperties != nil) {
            if ([c_TDAnalytics respondsToSelector:s_track_properties]) {
                [c_TDAnalytics performSelector:s_track_properties withObject:TD_REGISTER_EVENT withObject:eventModel.eventProperties];
            }
        } else {
            if ([c_TDAnalytics respondsToSelector:s_track]) {
                [c_TDAnalytics performSelector:s_track withObject:TD_REGISTER_EVENT];
            }
        }
        
        NSDate *registerTime = [NSDate date];
        NSInteger sourceGMTOffset = [[NSTimeZone localTimeZone] secondsFromGMTForDate:registerTime];
        double registerZoneOffset = (double)(sourceGMTOffset/3600.0);
        NSMutableDictionary *userProperties = [NSMutableDictionary dictionary];
        userProperties[TD_REGISTER_TIME] = registerTime;
        userProperties[TD_REGISTER_ZONE_OFFSET] = [NSNumber numberWithDouble:registerZoneOffset];
        if (eventModel.channel != nil) {
            userProperties[TD_CHANNEL] = eventModel.channel;
        }
        if (eventModel.userProperties != nil) {
            [userProperties addEntriesFromDictionary:eventModel.userProperties];
        }
        if ([c_TDAnalytics respondsToSelector:s_userSetOnce]) {
            [c_TDAnalytics performSelector:s_userSetOnce withObject:userProperties];
        }
    }
}

+ (void)trackLogin:(TDLoginEventModel *)eventModel {
    if (eventModel != nil) {
        Class c_TDAnalytics = NSClassFromString(@"TDAnalytics");
        if (c_TDAnalytics == nil) NSLog(@"TDAnalytics SDK is not found, you need to import TDAnalytics SDK first.");
        SEL s_login = NSSelectorFromString(@"login:");
        SEL s_track = NSSelectorFromString(@"track:");
        SEL s_track_properties = NSSelectorFromString(@"track:properties:");
        if (eventModel.accountId != nil) {
            if ([c_TDAnalytics respondsToSelector:s_login]) {
                [c_TDAnalytics performSelector:s_login withObject:eventModel.accountId];
            }
        }
        if (eventModel.eventProperties != nil) {
            if ([c_TDAnalytics respondsToSelector:s_track_properties]) {
                [c_TDAnalytics performSelector:s_track_properties withObject:TD_LOGIN_EVENT withObject:eventModel.eventProperties];
            }
        } else {
            if ([c_TDAnalytics respondsToSelector:s_track]) {
                [c_TDAnalytics performSelector:s_track withObject:TD_LOGIN_EVENT];
            }
        }

    }
}

+ (void)trackLogout {
    Class c_TDAnalytics = NSClassFromString(@"TDAnalytics");
    if (c_TDAnalytics == nil) NSLog(@"TDAnalytics SDK is not found, you need to import TDAnalytics SDK first.");
    SEL s_track = NSSelectorFromString(@"track:");
    SEL s_logout = NSSelectorFromString(@"logout");
    if ([c_TDAnalytics respondsToSelector:s_track]) {
        [c_TDAnalytics performSelector:s_track withObject:TD_LOGOUT_EVENT];
    }
    if ([c_TDAnalytics respondsToSelector:s_logout]) {
        [c_TDAnalytics performSelector:s_logout];
    }
}

+ (void)trackPayment:(TDPaymentEventModel *)eventModel {
    if (eventModel != nil) {
        NSDictionary *properties = [eventModel toJsonDictionary];
        
        Class c_TDAnalytics = NSClassFromString(@"TDAnalytics");
        if (c_TDAnalytics == nil) NSLog(@"TDAnalytics SDK is not found, you need to import TDAnalytics SDK first.");
        SEL s_track_properties = NSSelectorFromString(@"track:properties:");
        if ([c_TDAnalytics respondsToSelector:s_track_properties]) {
            [c_TDAnalytics performSelector:s_track_properties withObject:TD_PAYMENT_EVENT withObject:properties];
        }
    }
}

+ (void)enableAutoTrackManually {
    _enableAutoTrackManually = YES;
}

+ (BOOL)getEnableAutoTrackManually {
    return _enableAutoTrackManually;
}
@end
