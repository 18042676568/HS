//
//  UIView+Extension.m
//  UI01 - QQLoginByCode - 150810
//
//  Created by neuedu on 15/8/10.
//  Copyright (c) 2015年 neuedu. All rights reserved.
//

#import "UIView+Extension.h"

@implementation UIView (Extension)

-(void)setTop:(CGFloat)top{
    CGRect tmpframe = self.frame;
    tmpframe.origin.y = top;
    self.frame = tmpframe;
}

-(void)setBottom:(CGFloat)bottom{
    CGRect tmpframe = self.frame;
    tmpframe.origin.y = bottom - self.frame.size.height;
    self.frame = tmpframe;
}

-(void)setLeft:(CGFloat)left{
    CGRect tmpframe = self.frame;
    tmpframe.origin.x = left;
    self.frame = tmpframe;
}

-(void)setRight:(CGFloat)right{
    CGRect tmpframe = self.frame;
    tmpframe.origin.x = right - self.frame.size.width;
    self.frame = tmpframe;
}

-(void)setWidth:(CGFloat)width{
    CGRect tmpframe = self.frame;
    tmpframe.size.width = width;
    self.frame = tmpframe;
}

-(void)setHeight:(CGFloat)height{
    CGRect tmpframe = self.frame;
    tmpframe.size.height = height;
    self.frame = tmpframe;
}

-(CGFloat)top{
    return self.frame.origin.y;
}

-(CGFloat)bottom{
    return  self.frame.origin.y + self.frame.size.height;
}

-(CGFloat)left{
    return self.frame.origin.x;
}

-(CGFloat)right{
    return self.frame.origin.x + self.frame.size.width;
}

-(CGFloat)width{
    return self.frame.size.width;
}

-(CGFloat)height{
    return self.frame.size.height;
}

@end
