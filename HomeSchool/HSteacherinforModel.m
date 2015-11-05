//
//  HSteacherinforModel.m
//  night
//
//  Created by neuedu on 15/10/12.
//  Copyright (c) 2015年 neuedu. All rights reserved.
//

#import "HSteacherinforModel.h"

@implementation HSteacherinforModel
+(instancetype)hsteacherinforModelWithDict:(NSDictionary *)dict{
    HSteacherinforModel*teacherinfor = [[HSteacherinforModel alloc]init];
    if (teacherinfor) {
        teacherinfor.icon = [dict objectForKey:@"icon"];
        teacherinfor.name = [dict objectForKey:@"name"];
        teacherinfor.seniority = [dict objectForKey:@"seniority"];
        teacherinfor.subject =[dict objectForKey:@"subject"];
        teacherinfor.price = [dict objectForKey:@"price"];
        teacherinfor.infor = [dict objectForKey:@"infor"];
        //[teacherinfor setValuesForKeysWithDictionary:dict];
    }
    return teacherinfor;

}
@end
