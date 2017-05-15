//
//  XTMBProgressHUDUtils.m
//  XTMBProgressHUDUtils
//
//  Created by 何凯楠 on 2017/4/28.
//  Copyright © 2017年 HeXiaoBa. All rights reserved.
//

#import "XTMBProgressHUDUtils.h"
#import <objc/runtime.h>

static MBProgressHUD *xtHUD;

@interface XTMBProgressHUDUtils()


@end


@implementation XTMBProgressHUDUtils


+ (void)xtMB_showMessage:(NSString *)msg {
    [XTMBProgressHUDUtils xtMB_showMessage:msg delay:1];
}

+ (void)xtMB_showMessage:(NSString *)msg delay:(NSTimeInterval)delay {
    [XTMBProgressHUDUtils xtMB_showView:nil message:msg delay:delay];
}

+ (void)xtMB_showView:(UIView *)view message:(NSString *)msg {
    [XTMBProgressHUDUtils xtMB_showView:view message:msg delay:1];
}

+ (void)xtMB_showView:(UIView *)view message:(NSString *)msg delay:(NSTimeInterval)delay {
    if (!view) { view = [[UIApplication sharedApplication].windows lastObject]; }
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.mode = MBProgressHUDModeText;
    hud.label.text = msg;
    [hud showAnimated:YES];
    [hud hideAnimated:YES afterDelay:delay];
}

+ (void)xtMB_showIndeterminate {
    [XTMBProgressHUDUtils xtMB_showIndeterminateForMessage:nil];
}

+ (void)xtMB_showIndeterminateForMessage:(NSString *)msg {
    [XTMBProgressHUDUtils xtMB_showIndeterminateToView:nil message:msg];
}

+ (void)xtMB_showIndeterminateToView:(UIView *)view message:(NSString *)msg {
    [XTMBProgressHUDUtils xtMB_showView:view mode:MBProgressHUDModeIndeterminate message:msg];
}

+ (MBProgressHUD *)xtMB_showView:(UIView *)view mode:(MBProgressHUDMode)mode message:(NSString *)msg {
    if(!view) { view = [[UIApplication sharedApplication].windows lastObject]; }
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.mode = mode;
    hud.label.text = msg;
    [hud showAnimated:YES];
    //如果已经存在，则先移除之前存在的hud，就是不能同时存在两个hud，否则无法管理
    if (xtHUD) { [XTMBProgressHUDUtils xtMB_hidden]; }
    xtHUD = hud;
    return hud;
}

+ (void)xtMB_showView:(UIView *)view customView:(UIView *)customView message:(NSString *)msg {
    if(!view) { view = [[UIApplication sharedApplication].windows lastObject]; }
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.mode = MBProgressHUDModeCustomView;
    hud.label.text = msg;
    hud.customView = customView;
    [hud showAnimated:YES];
    //如果已经存在，则先移除之前存在的hud，就是不能同时存在两个hud，否则无法管理
    if (xtHUD) { [XTMBProgressHUDUtils xtMB_hidden]; }
    xtHUD = hud;

}

+ (void)xtMB_hidden {
    [XTMBProgressHUDUtils xtMB_hiddenAfterDelay:0];
}

+ (void)xtMB_hiddenAfterDelay:(NSTimeInterval)delay {
    if (xtHUD) {
        [xtHUD hideAnimated:YES afterDelay:delay];
    }
}


@end
