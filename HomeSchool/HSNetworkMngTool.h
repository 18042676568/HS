//
//  HSNetworkMngTool.h
//  HomeSchool
//
//  Created by neuedu on 15/10/18.
//  Copyright (c) 2015年 neuedu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HSNetworkMngTool : NSObject
+(instancetype)sharedNetworkMngTool;

-(void)HSNetworkLogon;
@end
