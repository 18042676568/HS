//
//  NSString+MoreExtentions.m
//  UI-微博
//
//  Created by neuedu on 15/8/24.
//  Copyright (c) 2015年 neuedu. All rights reserved.
//

#import "NSString+MoreExtentions.h"

@implementation NSString (MoreExtentions)

-(CGFloat)heightForWidth:(CGFloat)width Font:(UIFont *)font{

    NSDictionary *attributes = @{NSFontAttributeName:font};
    CGSize size = {width,MAXFLOAT};
    
    CGRect boundRect = [self boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:attributes context:nil];
    
    return boundRect.size.height;
}
-(CGFloat)widthForWidth:(CGFloat)width Font:(UIFont *)font{
    
    NSDictionary *attributes = @{NSFontAttributeName:font};
    CGSize size = {width,MAXFLOAT};
    
    CGRect boundRect = [self boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:attributes context:nil];
    
    return boundRect.size.width;
}

@end
