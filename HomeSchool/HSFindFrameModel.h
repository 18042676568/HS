//
//  HSFindFrameModel.h
//  HomeSchool
//
//  Created by neuedu on 15/10/29.
//  Copyright (c) 2015年 neuedu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "HSFindModel.h"
#import "NSString+MoreExtentions.h"

//红定义写道头文件中 便于cell引入
#define kMargin 8
#define kBigFont [UIFont systemFontOfSize:16.f]
#define kSmallFont [UIFont systemFontOfSize:14.f]
#define kSMargin 4

@interface HSFindFrameModel : NSObject

//frame模型包含数据模型
@property (strong,nonatomic)HSFindModel *find;
//头像
@property (assign,nonatomic)CGRect  iconFrame;
//名字
@property (assign,nonatomic)CGRect  nameFrame;
//正文
@property (assign,nonatomic)CGRect  textFrame;
//图片 9宫格 做一个可变数组 保存0～9个配图
@property (strong,nonatomic)NSMutableArray *picsFrame;

@property (assign,nonatomic)CGRect commentButtonFrame;
@property (assign,nonatomic)CGRect commentFrame;
@property (assign,nonatomic)CGRect timeFrame;
@property (assign,nonatomic)CGRect praiseFrame;
@property (assign,nonatomic)CGRect zanFrame;
@property (assign,nonatomic)CGRect commentsFrame;
//@property (assign,nonatomic)CGRect comsFrame;
@property (assign,nonatomic)CGFloat cellHeight;

+(instancetype)hsFindFrameModelWithHSFindModel:(HSFindModel *)find;
@end
