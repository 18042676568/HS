//
//  HSClassModel.h
//  HomeSchool
//
//  Created by neuedu on 15/9/16.
//  Copyright (c) 2015年 neuedu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HSClassModel : NSObject
@property (nonatomic,copy)NSString *time;
@property (nonatomic,copy)NSString *teacher;
@property (nonatomic,copy)NSString *lesson;
@property (nonatomic,copy)NSString *classAdd;
+(instancetype)hSClassModelWithDict:(NSDictionary *)dict;
@end
