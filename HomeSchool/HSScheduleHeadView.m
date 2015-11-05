//
//  HSScheduleHeadView.m
//  HomeSchool
//
//  Created by neuedu on 15/10/18.
//  Copyright (c) 2015年 neuedu. All rights reserved.
//

#import "HSScheduleHeadView.h"

@implementation HSScheduleHeadView

+(instancetype)scheduleHeadViewWithTitle:(NSString *)title{
    HSScheduleHeadView *headView = [[HSScheduleHeadView alloc]init];
    headView.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 40);
    UIView *view1 = [[UIView alloc]init];
    view1.backgroundColor = [UIColor grayColor];
    view1.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 1);
    [headView addSubview:view1];
    UILabel *label = [[UILabel alloc]init];
    label.frame = CGRectMake(0,10 , [UIScreen mainScreen].bounds.size.width, 25);
    label.textAlignment =  NSTextAlignmentCenter;
    label.text = title;
    label.font = [UIFont systemFontOfSize:17.f];
    [headView addSubview:label];
    UIView *view2 = [[UIView alloc]init];
    view2.backgroundColor = [UIColor grayColor];
    view2.frame = CGRectMake(0, 39, [UIScreen mainScreen].bounds.size.width, 1);
    [headView addSubview:view2];
    return headView;
    
}

@end
