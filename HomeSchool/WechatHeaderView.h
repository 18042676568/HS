//
//  WechatHeaderView.h
//  UI12 - WechatMoment - 150824
//
//  Created by neuedu on 15/8/24.
//  Copyright (c) 2015年 neuedu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WechatHeaderView : UIView

@property (weak, nonatomic) IBOutlet UIImageView *background;
@property (weak, nonatomic) IBOutlet UIButton *profileIcon;

@property (weak, nonatomic) IBOutlet UILabel *name;

+(instancetype)wechatHeaderView;

@end
