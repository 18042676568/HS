//
//  WechatViewCell.m
//  UI12 - WechatMoment - 150824
//
//  Created by neuedu on 15/8/24.
//  Copyright (c) 2015年 neuedu. All rights reserved.
//

#import "WechatViewCell.h"

@implementation WechatViewCell

- (void)awakeFromNib {
    // Initialization code
    UIImageView * icon = [[UIImageView alloc]init];
    _icon = icon;
    [self.contentView addSubview:icon];
    
    
    UILabel * name = [[UILabel alloc]init];
    _name = name;
    [self.contentView addSubview:name];
    name.font = nameFont;
    name.textColor = nameColor;
    
    
    UILabel * text = [[UILabel alloc]init];
    _text = text;
    [self.contentView addSubview:text];
    text.numberOfLines = 0;
    text.font = textFont;
    
    
    
//    UIImageView * picture = [[UIImageView alloc]init];
//    _picture = picture;
//    [self.contentView addSubview:picture];
    //九宫格
    _pictures = [NSMutableArray array];
    for (int i = 0; i<9; i++) {
        UIImageView * pic = [[UIImageView alloc]init];
        [_pictures addObject:pic];
        [self.contentView addSubview:pic];
    }
    
    
    UILabel * time = [[UILabel alloc]init];
    _time = time;
    [self.contentView addSubview:time];
    _time.font = textFont;
    [_time setTextColor:[UIColor grayColor]];
    
    
    UIButton * button = [[UIButton alloc]init];
    _button = button;
    [self.contentView addSubview:button];
    
    [button addTarget:self action:@selector(buttonClicked) forControlEvents:UIControlEventTouchUpInside];
    
}

-(void)buttonClicked{
    NSLog(@"More");
    [UIView animateWithDuration:1.f animations:^{
        UIButton * btn = [[UIButton alloc]init];
        [btn setTitle:@"赞👍" forState:UIControlStateNormal];
        btn.frame = CGRectMake(CGRectGetMinX(_button.frame)-40, CGRectGetMinY(_button.frame), 40, 44);
    }];
}

-(void)layoutSubviews{
    [super layoutSubviews];
    _icon.frame = _wechatFrame.iconFrame;
    
    _name.frame = _wechatFrame.nameFrame;
    
    _text.frame = _wechatFrame.textFrame;
    
    for (int i = 0; i<_wechatFrame.wechat.pictures.count; i++) {
        UIImageView * image = _pictures[i];
        NSValue * value = _wechatFrame.picturesFrame[i];
        image.frame = value.CGRectValue;
    }
    
    _time.frame = _wechatFrame.timeFrame;
    
    _button.frame = _wechatFrame.buttonFrame;
}

-(void)setWechatFrame:(WechatFrameModel *)wechatFrame{
    _wechatFrame = wechatFrame;
    
    WechatModel * wechat = wechatFrame.wechat;
    
    [_icon setImage:[UIImage imageNamed:wechat.icon]];
    
    [_name setText:wechat.name];
    
    [_text setText:wechat.text];
    
    //[_picture setImage:[UIImage imageNamed:wechat.picture]];
    
//    for (int i = 0; i<9; i++) {
//        NSString * str = wechat.pictures[i];
//        if (str.length != 0) {
//            [_pictures[i] setImage:[UIImage imageNamed:str]];
//            UIImageView * image = _pictures[i];
//             image.hidden = NO;
//        }else{
//            [_pictures[i] setImage:[UIImage imageNamed:@""]];
//                UIImageView * image = _pictures[i];
//              image.hidden = YES;
//        }
//        
//    }
    for (int i = 0; i<9; i++) {
        [_pictures[i] setImage:nil];
    }
    for (int i =0; i<wechatFrame.picturesFrame.count; i++) {
        [_pictures[i] setImage:[UIImage imageNamed:wechat.pictures[i]]];
    }
    
//    for (int i = 0; i<wechatFrame.picturesFrame.count; i++) {
//         UIImageView * image = _pictures[i];
//         image.hidden = NO;
//    }
//    for (NSUInteger i = wechatFrame.picturesFrame.count; i<9; i++) {
//          UIImageView * image = _pictures[i];
//          image.hidden = YES;
//    }
    
    [_time setText:[NSString stringWithFormat:@"%@",wechat.time]];
    
    [_button setImage:[UIImage imageNamed:@"plus_normal"] forState:UIControlStateNormal];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
