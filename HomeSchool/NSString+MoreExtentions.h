//
//  NSString+MoreExtentions.h
//  UI-微博
//
//  Created by neuedu on 15/8/24.
//  Copyright (c) 2015年 neuedu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>//系统自带的头文件  UI iOS  / ns ios mac

@interface NSString (MoreExtentions)

//能够返回字符串占用的高度，需要输入文字的size 以及文字的字体
-(CGFloat)heightForWidth:(CGFloat)width Font:(UIFont*)font;

-(CGFloat)widthForWidth:(CGFloat)width Font:(UIFont*)font;
@end
