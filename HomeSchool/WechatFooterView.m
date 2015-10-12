//
//  WechatFooterView.m
//  UI12 - WechatMoment - 150824
//
//  Created by neuedu on 15/8/24.
//  Copyright (c) 2015年 neuedu. All rights reserved.
//

#import "WechatFooterView.h"


@implementation WechatFooterView

+(instancetype)wechatFooterView{
    WechatFooterView * footerView = [[[NSBundle mainBundle]loadNibNamed:@"WechatFooterView" owner:nil options:nil]lastObject];
    return footerView;
}

- (IBAction)moreLoading:(UIButton *)sender {
    _button.hidden = YES;
    [_indicator startAnimating];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [_indicator stopAnimating];
        _button.hidden = NO;
        if ([_delegate respondsToSelector:@selector(didMoreLoad:)]) {
            [_delegate didMoreLoad:sender];
        }
    });
}
@end
