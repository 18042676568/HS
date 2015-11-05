//
//  HSteacherinforModel.h
//  night
//
//  Created by neuedu on 15/10/12.
//  Copyright (c) 2015年 neuedu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HSteacherinforModel : NSObject
@property(copy,nonatomic)NSString*icon;
@property(copy,nonatomic)NSString*name;
@property(copy,nonatomic)NSString*seniority;
@property(copy,nonatomic)NSString*subject;
@property(copy,nonatomic)NSString*infor;
@property(copy,nonatomic)NSString*price;

+(instancetype)hsteacherinforModelWithDict:(NSDictionary*)dict;

@end
