//
//  ViewController.m
//  PresetTemplateDemo
//
//  Created by huangdiao on 2023/10/25.
//

#import "ViewController.h"
#import <ThinkingSDK/ThinkingSDK.h>
#import <TDPresetTemplate/TDPresetTemplate.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSArray *btns = @[
        @"initTDAnalytics",
        @"trackRegister",
        @"trackLogin",
        @"trackLogout",
        @"trackPayment",
        @"flush"
    ];
    
    for (int i=0; i<btns.count; i++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setTitle:btns[i] forState:UIControlStateNormal];
        [btn setTitleColor:UIColor.blackColor forState:UIControlStateHighlighted];
        [btn setBackgroundColor:UIColor.blueColor];
        [self.view addSubview:btn];
        SEL s = NSSelectorFromString([NSString stringWithFormat:@"%@_onClick:", btns[i]]);
        [btn addTarget:self action:s forControlEvents:UIControlEventTouchUpInside];
        [btn setFrame:CGRectMake(50, 80*i+100, 300, 60)];
    }

    NSLog(@"TDPresetTemplateVersionNumber = %f", TDPresetTemplateVersionNumber);
    NSLog(@"TDPresetTemplateVersionString = %s", TDPresetTemplateVersionString);
}

- (void)initTDAnalytics_onClick:(UIButton *)sender {
    [TDAnalytics enableLog:YES];
    NSString *appId = @"7be5326f9f4a4e48933dbf2579367901";
    NSString *serverUrl = @"https://receiver-ta-preview.thinkingdata.cn";
    TDConfig *config = [[TDConfig alloc] initWithAppId:appId serverUrl:serverUrl];
    [TDAnalytics startAnalyticsWithConfig:config];
}
- (void)trackRegister_onClick:(UIButton *)sender {
    TDRegisterEventModel *eventModel = [TDRegisterEventModel new];
    eventModel.accountId = @"tiki-001";
    eventModel.channel = @"AppStore";
    eventModel.eventProperties = @{ @"register_source":@"douyin" };
    eventModel.userProperties = @{ @"register_code":@"JGYJ83L29JY" };
    [TDPresetTemplate trackRegister:eventModel];
}
- (void)trackLogin_onClick:(UIButton *)sender {
    TDLoginEventModel *eventModel = [TDLoginEventModel new];
    eventModel.accountId = @"tiki-002";
    eventModel.eventProperties = @{ @"login_type":@"wechat" };
    [TDPresetTemplate trackLogin:eventModel];
}
- (void)trackLogout_onClick:(UIButton *)sender {
    [TDPresetTemplate trackLogout];
}
- (void)trackPayment_onClick:(UIButton *)sender {
    
    TDPaymentEventModel *eventModel = [TDPaymentEventModel new];
    eventModel.orderId = @"id_1234567890";
    eventModel.paymentName = @"钻石礼包";
    eventModel.paymentNum = 100;
    eventModel.paymentType = @"Alipay";
    eventModel.currencyType = TDCurrencyTypeUSD;
    eventModel.payAmount = 0.99;
    eventModel.eventProperties = @{ @"payment_description":@"一大箱钻石💎" };
    [TDPresetTemplate trackPayment:eventModel];
}
- (void)flush_onClick:(UIButton *)sender {
    [TDAnalytics flush];
}
@end
