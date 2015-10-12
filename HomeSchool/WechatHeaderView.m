//
//  WechatHeaderView.m
//  UI12 - WechatMoment - 150824
//
//  Created by neuedu on 15/8/24.
//  Copyright (c) 2015年 neuedu. All rights reserved.
//

#import "WechatHeaderView.h"

@implementation WechatHeaderView

+(instancetype)wechatHeaderView{
    WechatHeaderView * headerView = [[[NSBundle mainBundle]loadNibNamed:@"WechatHeaderView" owner:nil options:nil]lastObject];
    return headerView;
}

-(void)awakeFromNib{
    [_background setImage:[UIImage imageNamed:@"pic_01"]];
    //[_profileIcon setImage:[UIImage imageNamed:@"icon"] forState:UIControlStateNormal];
    [_name setText:@"郑先玲"];
    
}

@end
