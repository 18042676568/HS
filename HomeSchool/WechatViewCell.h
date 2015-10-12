//
//  WechatViewCell.h
//  UI12 - WechatMoment - 150824
//
//  Created by neuedu on 15/8/24.
//  Copyright (c) 2015年 neuedu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WechatFrameModel.h"

@interface WechatViewCell : UITableViewCell

@property (weak,nonatomic) UIImageView * icon;
@property (weak,nonatomic) UILabel * name;
@property (weak,nonatomic) UILabel * text;
//@property (weak,nonatomic) UIImageView * picture;
@property (strong,nonatomic)NSMutableArray * pictures; //图片九宫格
@property (weak,nonatomic) UILabel * time;
@property (weak,nonatomic) UIButton * button;

@property (strong,nonatomic) WechatFrameModel * wechatFrame;

@end
