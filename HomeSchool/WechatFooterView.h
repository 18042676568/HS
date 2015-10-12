//
//  WechatFooterView.h
//  UI12 - WechatMoment - 150824
//
//  Created by neuedu on 15/8/24.
//  Copyright (c) 2015年 neuedu. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol wechatFooterViewDelegate <NSObject>

@optional
-(void)didMoreLoad:(UIButton *)sender;

@end
@interface WechatFooterView : UIView

@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *indicator;
@property (weak, nonatomic) IBOutlet UILabel *loadingText;
@property (weak, nonatomic) IBOutlet UIButton *button;

@property (weak,nonatomic) id <wechatFooterViewDelegate>delegate;

- (IBAction)moreLoading:(UIButton *)sender;

+(instancetype)wechatFooterView;

@end
