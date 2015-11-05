//
//  HSFindModel.h
//  HomeSchool
//
//  Created by neuedu on 15/10/29.
//  Copyright (c) 2015年 neuedu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Parse/Parse.h>

@interface HSFindModel : NSObject

//头像
@property (copy,nonatomic)NSString *icon;
//名字
@property (copy,nonatomic)NSString *name;
//正文
@property (copy,nonatomic)NSString *text;
//图片 9宫格 做一个可变数组 保存0～9个配图
@property (strong,nonatomic)NSMutableArray *pics;
@property (copy,nonatomic)NSString *time;
//@property (strong,nonatomic)NSArray *praises;
@property (copy,nonatomic)NSString *praise;

@property (copy,nonatomic)NSString *objectID;

@property (strong,nonatomic)NSMutableArray *comments;
//对模型进行扩充
@property (assign,nonatomic)BOOL commentHidden;
+(instancetype)hsFindModelWithDict:(PFObject *)dict;
@end
