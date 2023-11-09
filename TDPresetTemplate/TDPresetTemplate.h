//
//  TDPresetTemplate.h
//  TDPresetTemplate
//
//  Created by huangdiao on 2023/10/25.
//

#import <Foundation/Foundation.h>
#import "TDRegisterEventModel.h"
#import "TDLoginEventModel.h"
#import "TDPaymentEventModel.h"
#import "TDPresetConstant.h"

//! Project version number for TDPresetTemplate.
FOUNDATION_EXPORT double TDPresetTemplateVersionNumber;

//! Project version string for TDPresetTemplate.
FOUNDATION_EXPORT const unsigned char TDPresetTemplateVersionString[];

// In this header, you should import all the public headers of your framework using statements like #import <TDPresetTemplate/PublicHeader.h>

NS_ASSUME_NONNULL_BEGIN

@interface TDPresetTemplate : NSObject

/**
 Track user registration events.
 @param eventModel registered information, see <TDRegisterEventModel>
 */
+ (void)trackRegister:(TDRegisterEventModel *)eventModel;

/**
 Track login events.
 @param eventModel login information, see <TDLoginEventModel>
 */
+ (void)trackLogin:(TDLoginEventModel *)eventModel;

/**
 Track logout events.
 */
+ (void)trackLogout;

/**
 Track payment events.
 @param eventModel payment infomations, see <TDPaymentEventModel>
 */
+ (void)trackPayment:(TDPaymentEventModel *)eventModel;

/**
 Enable Auto-Tracking Events manually
 */
+ (void)enableAutoTrackManually;
+ (BOOL)getEnableAutoTrackManually;

@end

NS_ASSUME_NONNULL_END
