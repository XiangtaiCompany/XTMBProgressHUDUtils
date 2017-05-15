//
//  XTMBProgressHUDUtils.h
//  XTMBProgressHUDUtils
//
//  Created by 何凯楠 on 2017/4/28.
//  Copyright © 2017年 HeXiaoBa. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MBProgressHUD/MBProgressHUD.h>

@interface XTMBProgressHUDUtils : NSObject

/**
 显示文字，默认1秒

 @param msg 要显示的文字
 */
+ (void)xtMB_showMessage:(NSString *)msg;

/**
 显示文字，并且多长时间

 @param msg 文字
 @param delay 时间(秒)
 */
+ (void)xtMB_showMessage:(NSString *)msg delay:(NSTimeInterval)delay;

/**
 显示文字，显示哪个view上

 @param view 显示哪个view上
 @param msg 文字
 */
+ (void)xtMB_showView:(UIView *)view message:(NSString *)msg;

/**
 显示文字，显示哪个view上，显示时间

 @param view 显示哪个view上
 @param msg 文字
 @param delay 显示时间
 */
+ (void)xtMB_showView:(UIView *)view message:(NSString *)msg delay:(NSTimeInterval)delay;

/**
 显示mode为Indeterminate类型(菊花)
 */
+ (void)xtMB_showIndeterminate;

/**
 显示mode为Indeterminate类型(菊花)，以及文字

 @param msg 文字
 */
+ (void)xtMB_showIndeterminateForMessage:(NSString *)msg;

/**
 显示mode为Indeterminate类型(菊花)，要显示在哪个view上，显示什么文字

 @param view 要显示在哪个view上
 @param msg 显示什么文字
 */
+ (void)xtMB_showIndeterminateToView:(UIView *)view message:(NSString *)msg;

/**
 显示mode类型的hud，要显示在哪个view上，显示什么文字

 @param view 要显示在哪个view上
 @param mode 显示的类型
 @param msg 显示什么文字
 */
+ (MBProgressHUD *)xtMB_showView:(UIView *)view mode:(MBProgressHUDMode)mode message:(NSString *)msg;
/**
 自定义view，要显示在哪个view上，显示什么文字
 
 @param view 要显示在哪个view上
 @param customView 自定义view（一般为UIImageView，大小为37*37）
 @param msg 显示什么文字
 */
+ (void)xtMB_showView:(UIView *)view customView:(UIView *)customView message:(NSString *)msg;

/**
 移除hud
 */
+ (void)xtMB_hidden;

/**
 几秒后移除hud

 @param delay 几秒后
 */
+ (void)xtMB_hiddenAfterDelay:(NSTimeInterval)delay;

@end
