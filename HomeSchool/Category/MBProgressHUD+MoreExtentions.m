//
//  MBProgressHUD+MoreExtentions.m
//  KGKuGouPlayer
//
//  Created by neuedu on 15/10/20.
//  Copyright (c) 2015年 neuedu. All rights reserved.
//

#import "MBProgressHUD+MoreExtentions.h"

@implementation MBProgressHUD (MoreExtentions)
+ (MB_INSTANCETYPE)showHUDAddedTo:(UIView *)view labelText:(NSString *)labelText animated:(BOOL)animated {
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:animated];
    hud.labelText = labelText;
    return hud;
}

+ (void)showTipToWindow:(NSString *)tip{
    //提示应该保证足够的提升时间，一般显示到window或导航栏上
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:[UIApplication sharedApplication].keyWindow animated:YES];
    hud.mode = MBProgressHUDModeText;
    hud.labelText = tip;
    //屏幕的下面的1/4
    hud.yOffset = [UIScreen mainScreen].bounds.size.height*0.25;
    [hud hide:YES afterDelay:1.5f];
}
@end
