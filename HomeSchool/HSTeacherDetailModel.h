//
//  HSTeacherDetailModel.h
//  HomeSchool
//
//  Created by neuedu on 15/10/14.
//  Copyright (c) 2015年 neuedu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HSTeacherDetailModel : NSObject
//头像
@property(copy,nonatomic)NSString * icon;
//名字
@property(copy,nonatomic)NSString * name;
//介绍
@property(copy,nonatomic)NSString * Introduction;
//学科
@property(copy,nonatomic)NSString * seniority;
//位置
@property(copy,nonatomic)NSString * location;
//特点
@property(copy,nonatomic)NSString * feature;
//经验
@property(copy,nonatomic)NSString * Contact;

@property (copy, nonatomic) NSString *price;

@property (copy, nonatomic) NSString *subject;

@property (copy, nonatomic) NSString *infor;

+(instancetype)hsteacherDetailModelWithDict:(NSDictionary*)dict;
@end
