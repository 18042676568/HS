//
//  HSClassModel.m
//  HomeSchool
//
//  Created by neuedu on 15/9/16.
//  Copyright (c) 2015年 neuedu. All rights reserved.
//

#import "HSClassModel.h"

@implementation HSClassModel
+(instancetype)hSClassModelWithDict:(NSDictionary *)dict{
    HSClassModel *hsClass = [[HSClassModel alloc]init];
    if (hsClass) {
        [hsClass setValuesForKeysWithDictionary:dict];
    }
    return hsClass;
}
@end
