//
//  WechatFrameModel.h
//  UI12 - WechatMoment - 150824
//
//  Created by neuedu on 15/8/24.
//  Copyright (c) 2015年 neuedu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WechatModel.h"
#import <UIKit/UIKit.h>
#define MARGIN 8
#define nameFont [UIFont systemFontOfSize:14.f]
#define textFont [UIFont systemFontOfSize:14.f]
#define nameColor [UIColor colorWithRed:40.f/255.f green:175.f/255.f blue:240.f/255.f alpha:1.f]

@interface WechatFrameModel : NSObject

@property (strong,nonatomic) WechatModel * wechat;

@property (assign,nonatomic) CGRect iconFrame;
@property (assign,nonatomic) CGRect nameFrame;
@property (assign,nonatomic) CGRect textFrame;
//@property (assign,nonatomic) CGRect pictureFrame;
@property (strong,nonatomic) NSMutableArray * picturesFrame;
@property (assign,nonatomic) CGRect timeFrame;
@property (assign,nonatomic) CGRect buttonFrame;

@property (assign,nonatomic) CGFloat cellHeight;

+(instancetype)wechatFrameModelWithWechatModel:(WechatModel *)wechat;

@end
