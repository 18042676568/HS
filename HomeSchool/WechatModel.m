//
//  WechatModel.m
//  UI12 - WechatMoment - 150824
//
//  Created by neuedu on 15/8/24.
//  Copyright (c) 2015年 neuedu. All rights reserved.
//

#import "WechatModel.h"

@implementation WechatModel

+(instancetype)wecharModelWithDictionary:(NSDictionary *)dict{
    WechatModel * wechat = [[WechatModel alloc]init];
    if (wechat) {
        //[wechat setValuesForKeysWithDictionary:dict];
        wechat.icon = [dict objectForKey:@"icon"];
        wechat.name = [dict objectForKey:@"name"];
        wechat.text = [dict objectForKey:@"text"];
        wechat.time = [dict objectForKey:@"time"];
        wechat.pictures = [NSMutableArray array];
        NSArray * pics = [NSArray arrayWithArray:[dict objectForKey:@"picture"]];
        for (int i = 0; i<pics.count; i++) {
            [wechat.pictures addObject:pics[i]];
        }
    }
    return wechat;
}

@end
