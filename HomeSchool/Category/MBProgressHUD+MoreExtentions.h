//
//  MBProgressHUD+MoreExtentions.h
//  KGKuGouPlayer
//
//  Created by neuedu on 15/10/20.
//  Copyright (c) 2015年 neuedu. All rights reserved.
//

#import "MBProgressHUD.h"

@interface MBProgressHUD (MoreExtentions)
+ (MB_INSTANCETYPE)showHUDAddedTo:(UIView *)view labelText:(NSString *)labelText animated:(BOOL)animated;

//讲指定的提升语显示到window上3秒钟
+ (void)showTipToWindow:(NSString *)tip;
@end
