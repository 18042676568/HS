//
//  HSFindFrameModel.m
//  HomeSchool
//
//  Created by neuedu on 15/10/29.
//  Copyright (c) 2015年 neuedu. All rights reserved.
//

#import "HSFindFrameModel.h"

@implementation HSFindFrameModel
+(instancetype)hsFindFrameModelWithHSFindModel:(HSFindModel *)find{
    HSFindFrameModel *findModel = [[HSFindFrameModel alloc]init];
    if (findModel) {
        [findModel initWithHSFindModel:find];
    }
    return findModel;

}
-(void)initWithHSFindModel:(HSFindModel *)find{
    _find = find;
    _iconFrame = CGRectMake(kMargin, kMargin, 44.f, 44.f);
    CGFloat nameFrameH = [find.name heightForWidth:[UIScreen mainScreen].bounds.size.width Font:kBigFont];
    CGFloat nameFrameW = [find.name widthForWidth:[UIScreen mainScreen].bounds.size.width Font:kBigFont];
    _nameFrame = CGRectMake(CGRectGetMaxX(_iconFrame)+kMargin, CGRectGetMinY(_nameFrame)+2.f, nameFrameW, nameFrameH);
    
    CGFloat textFrameH = [find.text heightForWidth:[UIScreen mainScreen].bounds.size.width Font:kBigFont];
    _textFrame = CGRectMake(CGRectGetMinX(_nameFrame), CGRectGetMaxY(_nameFrame)+kMargin, [UIScreen mainScreen].bounds.size.width-kMargin-CGRectGetMinX(_nameFrame), textFrameH);
    
    _picsFrame = [NSMutableArray array];
    if (find.pics.count == 0||find.pics == nil) {
        _picsFrame = nil;
    }else if(find.pics.count == 4){
        CGFloat w = ([UIScreen mainScreen].bounds.size.width - CGRectGetMinX(_textFrame)-kMargin-kSMargin*3)/3;
        CGFloat h = w;
        
        for (int i=0; i<_find.pics.count; i++) {
            int row = i/2;
            int column = i%2;
            
            CGFloat x = CGRectGetMinX(_textFrame)+column*w+kSMargin*column;
            CGFloat y = CGRectGetMaxY(_textFrame)+kMargin+row*h+row*kSMargin;
            CGRect picFrame = CGRectMake(x, y, w, h);
            
            [_picsFrame addObject:[NSValue valueWithCGRect:picFrame]];
        }

    }else if(find.pics.count == 1){
        
        CGFloat w = ([UIScreen mainScreen].bounds.size.width - CGRectGetMinX(_textFrame)-kMargin-kSMargin*3)/2;
        CGFloat h = w;
        CGFloat x = CGRectGetMinX(_textFrame);
        CGFloat y = CGRectGetMaxY(_textFrame)+kMargin;
        CGRect picFrame = CGRectMake(x, y, w, h);
        
        [_picsFrame addObject:[NSValue valueWithCGRect:picFrame]];
        
     }else{
        CGFloat w = ([UIScreen mainScreen].bounds.size.width - CGRectGetMinX(_textFrame)-kMargin-kSMargin*3)/3;
        CGFloat h = w;
        
        for (int i=0; i<_find.pics.count; i++) {
            int row = i/3;
            int column = i%3;
            
            CGFloat x = CGRectGetMinX(_textFrame)+column*w+kSMargin*column;
            CGFloat y = CGRectGetMaxY(_textFrame)+kMargin+row*h+row*kSMargin;
            CGRect picFrame = CGRectMake(x, y, w, h);
            
            [_picsFrame addObject:[NSValue valueWithCGRect:picFrame]];
        }
 
    }
    CGFloat timeFrameY = 0;
    if (_picsFrame.count == 0) {
        timeFrameY = CGRectGetMaxY(_textFrame)+kMargin;
    }else{
        NSValue *lastPicFramevalue = [_picsFrame lastObject];
        CGRect lasPicFrame = [lastPicFramevalue CGRectValue];
        timeFrameY = CGRectGetMaxY(lasPicFrame)+kMargin;
    }
    
    CGFloat timeFrameH = [find.time heightForWidth:[UIScreen mainScreen].bounds.size.width Font:kSmallFont];
    CGFloat timeFrameW = [find.time widthForWidth:[UIScreen mainScreen].bounds.size.width Font:kSmallFont];
    _timeFrame = CGRectMake(CGRectGetMinX(_textFrame),timeFrameY , timeFrameW, timeFrameH);
    
    
    _commentButtonFrame = CGRectMake([UIScreen mainScreen].bounds.size.width-kMargin-20.f, CGRectGetMinY(_timeFrame), 20.f+10.f, 20.f);
    _commentFrame = CGRectMake([UIScreen mainScreen].bounds.size.width-kMargin-20.f, CGRectGetMinY(_commentButtonFrame), 100.f, 20.f);

    CGFloat praiseFrameH;
    CGFloat margin;
    if (find.praise.length == 0) {
        _zanFrame = CGRectZero;
        praiseFrameH = 0.f;
        margin = 0.f;
    }else{
    _zanFrame = CGRectMake(CGRectGetMinX(_textFrame), CGRectGetMaxY(_timeFrame)+kMargin, 20, 20);
     praiseFrameH = [find.praise heightForWidth:[UIScreen mainScreen].bounds.size.width Font:kBigFont];
        margin = kMargin;
    }
    _praiseFrame = CGRectMake(CGRectGetMinX(_textFrame), CGRectGetMaxY(_timeFrame)+margin,[UIScreen mainScreen].bounds.size.width - CGRectGetMinX(_textFrame)-kMargin, praiseFrameH);
    if(find.comments.count == 0){
        _commentsFrame = CGRectMake(CGRectGetMinX(_textFrame),  CGRectGetMaxY(_praiseFrame),[UIScreen mainScreen].bounds.size.width - CGRectGetMinX(_textFrame)-kMargin, 0);
    }else{
    _commentsFrame = CGRectMake(CGRectGetMinX(_textFrame),  CGRectGetMaxY(_praiseFrame),[UIScreen mainScreen].bounds.size.width - CGRectGetMinX(_textFrame)-kMargin, find.comments.count*18.f+kMargin);
    }
    
}
-(CGFloat)cellHeight{
    // NSLog(@"%f",CGRectGetMaxY(_timeFrame)+kMargin);
    return CGRectGetMaxY(_commentsFrame)+kMargin;
}
@end
