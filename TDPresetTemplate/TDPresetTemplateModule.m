//
//  TDPresetTemplateModule.m
//  DevelopProgram
//
//  Created by huangdiao on 2023/10/24.
//

#import "TDPresetTemplateModule.h"

//MARK: router
#import <ThinkingDataCore/TAAnnotation.h>
#import <ThinkingDataCore/TAModuleProtocol.h>
#import <ThinkingDataCore/TAContext.h>

#import <ThinkingSDK/ThinkingSDK.h>

#import "TDPresetTemplate.h"

static NSString * const kTDAnalyticsSDKName = @"ThinkingDataAnalytics";
static NSString * const kTDAnalyticsEventInit = @"TDAnalyticsInit";
static NSString * const kTDAnalyticsEventDeviceActivation = @"TDAnalyticsDeviceActivation";

static NSString * const TD_NEW_DEVICE_EVENT = @"ta_new_device";

ThinkingMod(TDPresetTemplateModule)
@interface TDPresetTemplateModule () <TAModuleProtocol>

@end

@implementation TDPresetTemplateModule

- (void)modDidCustomEvent:(TAContext *)context {
    NSString *moduleName = context.customParam[@"module"];
    NSDictionary *params = context.customParam[@"params"];
    
    if ([moduleName isEqualToString:kTDAnalyticsSDKName]) {
        NSString *eventType = params[@"type"];
        if ([eventType isEqualToString:kTDAnalyticsEventDeviceActivation]) {
            [self trackDeviceActivation];
        } else if ([eventType isEqualToString:kTDAnalyticsEventInit]) {
            [self enableAutoTrack];
        }
    }
}

- (void)trackDeviceActivation {
    NSString *firstCheckId = [TDAnalytics getDeviceId];
    TDFirstEventModel *eventModel = [[TDFirstEventModel alloc] initWithEventName:TD_NEW_DEVICE_EVENT
                                                                    firstCheckID:firstCheckId];
    [TDAnalytics trackWithEventModel:eventModel];
}

- (void)enableAutoTrack {
    if ([TDPresetTemplate getEnableAutoTrackManually] == NO) {
        [TDAnalytics enableAutoTrack:TDAutoTrackEventTypeAppInstall | TDAutoTrackEventTypeAppStart | TDAutoTrackEventTypeAppEnd | TDAutoTrackEventTypeAppViewCrash];
    }
}

@end
