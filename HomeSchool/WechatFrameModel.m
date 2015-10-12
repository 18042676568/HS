//
//  WechatFrameModel.m
//  UI12 - WechatMoment - 150824
//
//  Created by neuedu on 15/8/24.
//  Copyright (c) 2015年 neuedu. All rights reserved.
//

#import "WechatFrameModel.h"
#import "NSString+MoreExtentions.h"

@implementation WechatFrameModel

+(instancetype)wechatFrameModelWithWechatModel:(WechatModel *)wechat{
    WechatFrameModel * frameModel = [[WechatFrameModel alloc]init];
    if (frameModel) {
        [frameModel initWithFrameModel:wechat];
    }
    return frameModel;
}

-(void)initWithFrameModel:(WechatModel *)wechat{
    _wechat = wechat;
    CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
    
    _iconFrame = CGRectMake(MARGIN, MARGIN, 44.f, 44.f);
    
    CGFloat nameX = CGRectGetMaxX(_iconFrame) + MARGIN;
    CGFloat nameY = CGRectGetMinY(_iconFrame);
    CGFloat nameW = [wechat.name widthForText:(screenWidth - nameX) WithFont:nameFont];
    CGFloat nameH = [wechat.name heightForTextWithWidth:(screenWidth - nameX) WithFont:nameFont];
    _nameFrame = CGRectMake(nameX, nameY, nameW, nameH);
    
    if (wechat.text == nil || wechat.text.length == 0) {
        _textFrame = CGRectZero;
    }else{
        CGFloat textX = CGRectGetMinX(_nameFrame);
        CGFloat textY = CGRectGetMaxY(_nameFrame) + MARGIN;
        CGFloat textW = [wechat.text widthForText:(screenWidth - textX - MARGIN) WithFont:textFont];
        CGFloat textH = [wechat.text heightForTextWithWidth:(screenWidth - textX - MARGIN) WithFont:textFont];
        _textFrame = CGRectMake(textX, textY, textW, textH);
   }

    _picturesFrame = [NSMutableArray array];
    if (wechat.pictures == nil||wechat.pictures.count == 0) {
        _picturesFrame = nil;
        CGFloat timeX = CGRectGetMinX(_textFrame);
        CGFloat timeY = CGRectGetMaxY(_textFrame)+MARGIN;
        CGFloat timeW = screenWidth - nameX - MARGIN;
        CGFloat timeH = [wechat.time heightForTextWithWidth:(screenWidth - timeX - MARGIN) WithFont:textFont];
        _timeFrame = CGRectMake(timeX, timeY, timeW, timeH);
    }else{
        if (wechat.pictures.count == 1) {
           if (wechat.text == nil || wechat.text.length == 0) {
                 CGFloat picX = CGRectGetMinX(_nameFrame);
                 CGFloat picY = CGRectGetMaxY(_nameFrame) + MARGIN;
                 CGFloat picW = 200.f;
                 CGFloat picH = 200.f;
                 CGRect picFrame = CGRectMake(picX, picY, picW, picH);
               NSValue * value = [NSValue valueWithCGRect:picFrame];
               [_picturesFrame addObject:value];
             }else{
                CGFloat picX = CGRectGetMinX(_textFrame);
                CGFloat picY = CGRectGetMaxY(_textFrame) + MARGIN;
                CGFloat picW = 200.f;
                CGFloat picH = 200.f;
                CGRect picFrame = CGRectMake(picX, picY, picW, picH);
                 NSValue * value = [NSValue valueWithCGRect:picFrame];
                 [_picturesFrame addObject:value];
             }
            NSValue * value = _picturesFrame.firstObject;
            CGFloat timeX = CGRectGetMinX(value.CGRectValue);
            CGFloat timeY = CGRectGetMaxY(value.CGRectValue)+MARGIN;
            CGFloat timeW = screenWidth - nameX - MARGIN;
            CGFloat timeH = [wechat.time heightForTextWithWidth:(screenWidth - timeX - MARGIN) WithFont:textFont];
            _timeFrame = CGRectMake(timeX, timeY, timeW, timeH);
        }else{
            if (wechat.text == nil || wechat.text.length == 0) {
                for (int i = 0; i<wechat.pictures.count; i++) {
                    int m = i/3;
                    int n = i%3;
                    CGFloat picW = 70;
                    CGFloat picH = 70;
                    CGFloat picX = CGRectGetMinX(_nameFrame)+(picW+MARGIN)*n;
                    CGFloat picY = CGRectGetMaxY(_nameFrame) +(picH+MARGIN)*m;
                    CGRect picFrame = CGRectMake(picX, picY, picW, picH);
                    NSValue * value = [NSValue valueWithCGRect:picFrame];
                    [_picturesFrame addObject:value];
                }
                
            }else{
                for (int i = 0; i<wechat.pictures.count; i++) {
                    int m = i/3;
                    int n = i%3;
                    CGFloat picW = 70;
                    CGFloat picH = 70;
                    CGFloat picX = CGRectGetMinX(_textFrame)+(picW+MARGIN)*n;
                    CGFloat picY = CGRectGetMaxY(_textFrame)+MARGIN+(picH+MARGIN)*m;
                    CGRect picFrame = CGRectMake(picX, picY, picW, picH);
                    NSValue * value = [NSValue valueWithCGRect:picFrame];
                    [_picturesFrame addObject:value];
                }
            }
            int num = (int)(wechat.pictures.count/3);
            if (wechat.pictures.count%3 == 0) {
                num = ((int)(wechat.pictures.count/3) - 1)*3;
            }else{
                num = ((int)(wechat.pictures.count/3))*3;
            }
            NSValue * value = _picturesFrame[num];
            CGFloat timeX = CGRectGetMinX(value.CGRectValue);
            CGFloat timeY = CGRectGetMaxY(value.CGRectValue)+MARGIN;
            CGFloat timeW = screenWidth - nameX - MARGIN;
            CGFloat timeH = [wechat.time heightForTextWithWidth:(screenWidth - timeX - MARGIN) WithFont:textFont];
            _timeFrame = CGRectMake(timeX, timeY, timeW, timeH);
        }
       
    }
    
    CGFloat buttonX = screenWidth - MARGIN - 20;
    CGFloat buttonY = CGRectGetMinY(_timeFrame);
    CGFloat buttonW = 14.f;
    CGFloat buttonH = 14.f;
    _buttonFrame = CGRectMake(buttonX, buttonY, buttonW, buttonH);
}

-(CGFloat)cellHeight{
//    if (_wechat.text == nil || _wechat.text.length == 0) {
//        _cellHeight = CGRectGetMaxY(_pictureFrame)+MARGIN;
//    }else{
//        _cellHeight = CGRectGetMaxY(_textFrame) + MARGIN;
//    }
//    
//    if (_wechat.picture == nil || _wechat.picture.length == 0) {
//        _cellHeight = CGRectGetMaxY(_textFrame)+ MARGIN;
//    }else{
//        //_cellHeight = CGRectGetMaxY(_pictureFrame) + MARGIN;
//        _cellHeight = CGRectGetMaxY(_pictureFrame) + MARGIN;
//    }
    _cellHeight = CGRectGetMaxY(_timeFrame) + MARGIN;
    return _cellHeight;
}

@end
