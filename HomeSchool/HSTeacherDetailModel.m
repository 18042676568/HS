//
//  HSTeacherDetailModel.m
//  HomeSchool
//
//  Created by neuedu on 15/10/14.
//  Copyright (c) 2015年 neuedu. All rights reserved.
//

#import "HSTeacherDetailModel.h"

@implementation HSTeacherDetailModel
+(instancetype)hsteacherDetailModelWithDict:(NSDictionary *)dict{
    HSTeacherDetailModel *detail = [[HSTeacherDetailModel alloc]init];
    if (detail) {
        [detail  setValuesForKeysWithDictionary:dict];
    }
    return detail;
}
@end
