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

//#if __has_include(<ThinkingSDK/ThinkingSDK.h>)
//#import <ThinkingSDK/ThinkingSDK.h>
//#define TDAnalyticsAvailably 1
//#endif

#import "TDPresetTemplate.h"

static NSString * const kTDAnalyticsSDKName = @"ThinkingDataAnalytics";
static NSString * const kTDAnalyticsEventInit = @"TDAnalyticsInit";
static NSString * const kTDAnalyticsEventDeviceActivation = @"TDAnalyticsDeviceActivation";

static NSString * const TD_NEW_DEVICE_EVENT = @"ta_new_device";

ThinkingMod(TDPresetTemplateModule)
//char * kTDPresetTemplateModule_mod __attribute((used, section("__DATA, ThinkingMods"))) = "TDPresetTemplateModule";
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
    Class c_TDAnalytics = NSClassFromString(@"TDAnalytics");
    if (c_TDAnalytics == nil) NSLog(@"TDAnalytics SDK is not found, you need to import TDAnalytics SDK first.");
    SEL s_getDeviceId = NSSelectorFromString(@"getDeviceId");
    SEL s_trackWithEventModel = NSSelectorFromString(@"trackWithEventModel:");
    Class c_TDFirstEventModel = NSClassFromString(@"TDFirstEventModel");
    SEL s_initWithEventName_firstCheckID = NSSelectorFromString(@"initWithEventName:firstCheckID:");
    if ([c_TDAnalytics respondsToSelector:s_getDeviceId]
        && [c_TDAnalytics respondsToSelector:s_trackWithEventModel]
        && [c_TDFirstEventModel respondsToSelector:s_initWithEventName_firstCheckID]) {
        NSString *firstCheckId = [c_TDAnalytics performSelector:s_getDeviceId];
        id eventModel = [[c_TDFirstEventModel alloc] performSelector:s_initWithEventName_firstCheckID withObject:TD_NEW_DEVICE_EVENT withObject:firstCheckId];
        [c_TDAnalytics performSelector:s_trackWithEventModel withObject:eventModel];
    }
}

- (void)enableAutoTrack {
    if ([TDPresetTemplate getEnableAutoTrackManually] == NO) {
        Class c_TDAnalytics = NSClassFromString(@"TDAnalytics");
        if (c_TDAnalytics == nil) NSLog(@"TDAnalytics SDK is not found, you need to import TDAnalytics SDK first.");
        SEL s_enableAutoTrack = NSSelectorFromString(@"enableAutoTrack:");
        if ([c_TDAnalytics respondsToSelector:s_enableAutoTrack]) {
            // TDAutoTrackEventTypeAppInstall
            // | TDAutoTrackEventTypeAppStart
            // | TDAutoTrackEventTypeAppEnd
            // | TDAutoTrackEventTypeAppViewCrash
            NSInteger autoTrackType = 51;
            NSInvocation *inv = [NSInvocation invocationWithMethodSignature:[c_TDAnalytics methodSignatureForSelector:s_enableAutoTrack]];
            [inv setSelector:s_enableAutoTrack];
            [inv setTarget:c_TDAnalytics];
            [inv setArgument:&(autoTrackType) atIndex:2];
            [inv performSelector:@selector(invoke)];
        }
    }
}

@end
