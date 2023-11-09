//
//  TDPresetTemplate.m
//  DevelopProgram
//
//  Created by huangdiao on 2023/10/24.
//

#import "TDPresetTemplate.h"
#import <ThinkingSDK/ThinkingSDK.h>
#import <ThinkingSDK/NSDate+TDFormat.h>

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

+ (void)trackDeviceActivation {
    NSString *firstCheckId = [TDAnalytics getDeviceId];
    TDFirstEventModel *eventModel = [[TDFirstEventModel alloc] initWithEventName:TD_NEW_DEVICE_EVENT
                                                                    firstCheckID:firstCheckId];
    [TDAnalytics trackWithEventModel:eventModel];
}

+ (void)trackRegister:(TDRegisterEventModel *)eventModel {
    if (eventModel != nil) {
        if (eventModel.accountId != nil) {
            [TDAnalytics login:eventModel.accountId];
        }
        if (eventModel.eventProperties != nil) {
            [TDAnalytics track:TD_REGISTER_EVENT properties:eventModel.eventProperties];
        } else {
            [TDAnalytics track:TD_REGISTER_EVENT];
        }
        
        NSDate *registerTime = [NSDate date];
        double registerZoneOffset = [registerTime ta_timeZoneOffset:[NSTimeZone localTimeZone]];
        NSMutableDictionary *userProperties = [NSMutableDictionary dictionary];
        userProperties[TD_REGISTER_TIME] = registerTime;
        userProperties[TD_REGISTER_ZONE_OFFSET] = [NSNumber numberWithDouble:registerZoneOffset];
        if (eventModel.channel != nil) {
            userProperties[TD_CHANNEL] = eventModel.channel;
        }
        if (eventModel.userProperties != nil) {
            [userProperties addEntriesFromDictionary:eventModel.userProperties];
        }
        [TDAnalytics userSetOnce:userProperties];
    }
}

+ (void)trackLogin:(TDLoginEventModel *)eventModel {
    if (eventModel != nil) {
        if (eventModel.accountId != nil) {
            [TDAnalytics login:eventModel.accountId];
        }
        if (eventModel.eventProperties != nil) {
            [TDAnalytics track:TD_LOGIN_EVENT properties:eventModel.eventProperties];
        } else {
            [TDAnalytics track:TD_LOGIN_EVENT];
        }
    }
}

+ (void)trackLogout {
    [TDAnalytics track:TD_LOGOUT_EVENT];
    [TDAnalytics logout];
}

+ (void)trackPayment:(TDPaymentEventModel *)eventModel {
    if (eventModel != nil) {
        NSDictionary *properties = [eventModel toJsonDictionary];
        [TDAnalytics track:TD_PAYMENT_EVENT properties:properties];
    }
}

+ (void)enableAutoTrackManually {
    _enableAutoTrackManually = YES;
}

+ (BOOL)getEnableAutoTrackManually {
    return _enableAutoTrackManually;
}
@end
