//
//  NSString+MoreExtentions.m
//  UI12 - MicroBlog
//
//  Created by neuedu on 15/8/24.
//  Copyright (c) 2015年 neuedu. All rights reserved.
//

#import "NSString+MoreExtentions.h"

@implementation NSString (MoreExtentions)

-(CGFloat)heightForText:(CGSize)size WithFont:(UIFont *)font{
    //attribute:文字的字体
    NSDictionary *attribute = @{NSFontAttributeName:font};
    
    CGRect boundRect = [self boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:attribute context:nil];
    
    return boundRect.size.height;
}

-(CGFloat)heightForTextWithWidth:(CGFloat)width WithFont:(UIFont *)font{
     //size:文字占多宽,高度设无穷大，给文字适应高度 
    CGSize size = {width,MAXFLOAT};
    NSDictionary *attribute = @{NSFontAttributeName:font};
    
    CGRect boundRect = [self boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:attribute context:nil];
    
    return boundRect.size.height;
}

-(CGFloat)widthForText:(CGFloat)width WithFont:(UIFont *)font{
    CGSize size = {width,MAXFLOAT};
    NSDictionary * attribute = @{NSFontAttributeName:font};
    
    CGRect bountRect = [self boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:attribute context:nil];
    
    return bountRect.size.width;
}
@end
