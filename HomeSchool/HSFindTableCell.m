//
//  HSFindTableCell.m
//  HomeSchool
//
//  Created by neuedu on 15/10/27.
//  Copyright (c) 2015年 neuedu. All rights reserved.
//

#import "HSFindTableCell.h"
#import <UIImageView+WebCache.h>
#import "UIImageView+showImage.h"

#define kBigFont [UIFont systemFontOfSize:16.f]
#define kSmallFont [UIFont systemFontOfSize:14.f]
#define kNameColor [UIColor colorWithRed:50.f/255.f green:175.f/255.f blue:240.f/255.f alpha:1.f]
#define kTitleBarColor [UIColor colorWithRed:67.f/255.f green:137.f/255.f blue:160.f/255.f alpha:1.0f]
@implementation HSFindTableCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self addContentSubviews];
    }
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    return self;

}
- (void)addContentSubviews{
    UIImageView *icon = [[UIImageView alloc]init];
    _icon =icon;
    [self.contentView addSubview:icon];
    
    UILabel *name = [[UILabel alloc]init];
    _name = name;
    [self.contentView addSubview:name];
    name.font = kBigFont;
    name.textColor = kNameColor;
    
    UILabel *text = [[UILabel alloc]init];
    _text = text;
    [self.contentView addSubview:text];
    text.font = kBigFont;
    text.numberOfLines = 0;
    text.textColor = [UIColor blackColor];
    
    //9宫格的配图
    _pics = [NSMutableArray array];
    for (int i = 0; i<9; i++) {
        UIImageView *pic = [[UIImageView alloc]init];
        pic.userInteractionEnabled = YES;
        [_pics addObject:pic];
        [self.contentView addSubview:pic];
    }
    
    UILabel *time = [[UILabel alloc]init];
    _time = time;
    [self.contentView addSubview:time];
    time.font = kSmallFont;
    time.textColor = [UIColor grayColor];
    
    UIButton *commentButton = [[UIButton alloc]init];
    _commentButton = commentButton;
    [self.contentView addSubview:commentButton];
    
    [commentButton setImage:[UIImage imageNamed:@"addcomment"] forState:UIControlStateNormal];
    [commentButton addTarget:self action:@selector(comment:) forControlEvents:UIControlEventTouchUpInside];
    commentButton.backgroundColor = [UIColor whiteColor];
    
    
    
    UIView *comment = [[UIView alloc]init];
    _comment = comment;
    comment.hidden = YES;
    comment.backgroundColor = [UIColor colorWithRed:248.f/255.f green:248.f/255.f blue:248.f/255.f alpha:1.0f];
    [self.contentView addSubview:comment];
    [self.contentView bringSubviewToFront:_commentButton];
    
    UIButton *zbtn = [[UIButton alloc]init];
    zbtn.frame = CGRectMake(0, 0, 49, 20);
    [zbtn setTitle:@"赞" forState:UIControlStateNormal];
    zbtn.titleLabel.font = [UIFont systemFontOfSize:15.f];
    [zbtn setImage:[UIImage imageNamed:@"ic_face"] forState:UIControlStateNormal];
    [zbtn addTarget:self action:@selector(addPraise:) forControlEvents:UIControlEventTouchUpInside];
    [zbtn setTitleColor:kTitleBarColor forState:UIControlStateNormal];
    [comment addSubview:zbtn];
    
    UIButton *cbtn = [[UIButton alloc]init];
    cbtn.frame = CGRectMake(51, 0, 49, 20);
    [cbtn setTitle:@"评" forState:UIControlStateNormal];
    cbtn.titleLabel.font = [UIFont systemFontOfSize:15.f];
    [cbtn setImage:[UIImage imageNamed:@"comment"] forState:UIControlStateNormal];
    [cbtn addTarget:self action:@selector(addComment:) forControlEvents:UIControlEventTouchUpInside];
    [cbtn setTitleColor:kTitleBarColor forState:UIControlStateNormal];
    [comment addSubview:cbtn];

//    UIView *praise = [[UIView alloc]init];
//    _praise = praise;
//    [self.contentView addSubview:praise];
    UIImageView *zan = [[UIImageView alloc]init];
    _zan = zan;
    zan.image = [UIImage imageNamed:@"zan"];
    [self.contentView addSubview:zan];
    [self.contentView bringSubviewToFront:zan];
    
    UILabel *p = [[UILabel alloc]init];
    _p = p;
    p.numberOfLines = 0;
    p.font = kSmallFont;
    p.textColor = kTitleBarColor;
    p.backgroundColor = [UIColor colorWithRed:150.f/255.f green:150.f/255.f blue:150.f/255.f alpha:0.1f];
    //[praise addSubview:p];
    [self.contentView addSubview:p];
    
    UILabel *comments = [[UILabel alloc]init];
    _comm = comments;
    _comm.backgroundColor = [UIColor colorWithRed:150.f/255.f green:150.f/255.f blue:150.f/255.f alpha:0.1f];
    _comm.font = kSmallFont;
    _comm.numberOfLines = 0;
    [self.contentView addSubview:comments];
    
}

- (void)awakeFromNib {
    // Initialization code
}


-(void)layoutSubviews{
    [super layoutSubviews];
    _icon.frame = _findFrame.iconFrame;
    _name.frame = _findFrame.nameFrame;
    _text.frame = _findFrame.textFrame;
    _p.frame = _findFrame.praiseFrame;
    
    for (int i=0; i< _findFrame.picsFrame.count; i++) {
        UIImageView *pic =_pics[i];
        pic.frame = [_findFrame.picsFrame[i] CGRectValue];
    }
    _time.frame = _findFrame.timeFrame;
    _commentButton.frame = _findFrame.commentButtonFrame;
    _comment.frame = _findFrame.commentFrame;
    _zan.frame = _findFrame.zanFrame;
    _comm.frame = _findFrame.commentsFrame;
}



////图片放大
//-(void)magnifyImage:(UIImageView *)image
//{
//    
//    NSLog(@"%@",image);
//    
//    [UIImageView showImage:image];//调用方法
//    
//}

-(void)setFindFrame:(HSFindFrameModel *)findFrame{

    _findFrame = findFrame;
    HSFindModel *find = findFrame.find;
    [_icon sd_setImageWithURL:[NSURL URLWithString:find.icon] placeholderImage:[UIImage imageNamed:@"placeholder"]];
    
    [_name setText:find.name];
    [_text setText:find.text];
    [_time setText:find.time];
    [_p setText:find.praise];
    NSMutableAttributedString *coms = [[NSMutableAttributedString alloc]init];
    for (int i=0; i<find.comments.count; i++) {
        NSDictionary *com = find.comments[i];
        NSUInteger leng = ((NSString *)com.allKeys[0]).length;
        NSString *com_s = [NSString stringWithFormat:@"%@:%@\n",com.allKeys[0],com.allValues[0]];
        //NSDictionary *att =@{NSForegroundColorAttributeName:kTitleBarColor};
        NSMutableAttributedString *com_at = [[NSMutableAttributedString alloc]initWithString:com_s];
        
        [com_at addAttribute:NSForegroundColorAttributeName value:kTitleBarColor range:NSMakeRange(0, leng)];
         [coms appendAttributedString:com_at];
    }
    NSLog(@"%@",coms);
    _comm.attributedText = coms;
    
    //[_comm setText:find.]
    
//    _comment.hidden = _wechatFrame.wechat.commentHidden;
//    _commentButton.selected = NO;
    //NSLog(@"%lu",_wechatFrame.picsFrame.count);
    
    for (int i=0; i<9; i++) {
        UIImageView *pic = _pics[i];
        [pic setImage:nil];
        
    }
    
    
    if (_findFrame.picsFrame.count != 0) {
        for (int i=0; i<_findFrame.picsFrame.count; i++) {
            UIImageView *pic = _pics[i];
            [pic sd_setImageWithURL:[NSURL URLWithString:find.pics[i]]];
//            UITapGestureRecognizer
//            *tap  = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(magnifyImage:)];
//            [pic
//             addGestureRecognizer:tap];

        }
    }
}
#pragma mark 点赞
- (void)comment:(UIButton *)sender{
//    NSLog(@"点赞");
//    BOOL a = sender.selected;
//    NSLog(@"%d",a);
    sender.selected = !sender.selected;
//    BOOL b = sender.selected;
//    NSLog(@"%d",b);
    if (sender.selected) {
        _comment.hidden = NO;
        [UIView animateWithDuration:1.0f animations:^{
            _comment.frame = CGRectMake(_comment.frame.origin.x-100.f, _comment.frame.origin.y, _comment.frame.size.width, _comment.frame.size.height);
        }];
        
    }else{
        //_comment.hidden = YES;
        
        [UIView animateWithDuration:1.0f animations:^{
            _comment.frame = CGRectMake(_comment.frame.origin.x+100.f, _comment.frame.origin.y, _comment.frame.size.width, _comment.frame.size.height);
        } completion:^(BOOL finished) {
            _comment.hidden = YES;
        }];
        
    }
    _findFrame.find.commentHidden = _comment.hidden;
}
- (void)addPraise:(UIButton *)sender{
   // NSLog(@"asd");
    if ([_delegate respondsToSelector:@selector(findtableViewCell:withObjectId:)]) {
        [_delegate findtableViewCell:self withObjectId:_findFrame.find.objectID];
    }
}

- (void)addComment:(UIButton *)sender{
    if ([_delegate respondsToSelector:@selector(commentWithTableViewCell:withObjectId:)]) {
        [_delegate commentWithTableViewCell:self withObjectId:_findFrame.find.objectID];
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

@end
