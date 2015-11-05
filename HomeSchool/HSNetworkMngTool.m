//
//  HSNetworkMngTool.m
//  HomeSchool
//
//  Created by neuedu on 15/10/18.
//  Copyright (c) 2015年 neuedu. All rights reserved.
//

#import "HSNetworkMngTool.h"

static HSNetworkMngTool *tool;
@implementation HSNetworkMngTool

+(instancetype)sharedNetworkMngTool{
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        tool = [[HSNetworkMngTool alloc]init];
    });
    return tool;
}
+(instancetype)allocWithZone:(struct _NSZone *)zone{
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        tool = [super allocWithZone:zone];
    });
    return tool;
}

-(void)HSNetworkLogon{
    
}
@end
