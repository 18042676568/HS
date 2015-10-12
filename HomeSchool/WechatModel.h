//
//  WechatModel.h
//  UI12 - WechatMoment - 150824
//
//  Created by neuedu on 15/8/24.
//  Copyright (c) 2015年 neuedu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WechatModel : NSObject

@property (copy,nonatomic) NSString * icon;
@property (copy,nonatomic) NSString * name;
@property (copy,nonatomic) NSString * text;
//@property (strong,nonatomic) NSString * picture;
@property (strong,nonatomic) NSMutableArray * pictures;
@property (copy,nonatomic) NSString * time;


+(instancetype)wecharModelWithDictionary:(NSDictionary *)dict;

@end
