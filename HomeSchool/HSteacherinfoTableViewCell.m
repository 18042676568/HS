//
//  HSteacherinfoTableViewCell.m
//  night
//
//  Created by neuedu on 15/10/12.
//  Copyright (c) 2015年 neuedu. All rights reserved.
//

#import "HSteacherinfoTableViewCell.h"

#define Margin 8.f
#define SMargin 5.f
#define ScreenWidth [UIScreen mainScreen].bounds.size.width
#define ScreenHeight [UIScreen mainScreen].bounds.size.height
#define Bigtitle [UIFont systemFontOfSize:14.f]
#define Smalltitle [UIFont systemFontOfSize:12.f]

@implementation HSteacherinfoTableViewCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self addContentSubviews];
    }
    //self.selectionStyle = UITableViewCellSelectionStyleNone;
    return self;
}

- (void)awakeFromNib {
    // Initialization code
}

#pragma mark 添加子控件
- (void)addContentSubviews{
   //self.contentView.backgroundColor = [UIColor colorWithRed:212.f/255.f green:223.f/255.f blue:213.f/255.f alpha:1.f];
    UIView *view = [[UIView alloc]init];
    view.frame = CGRectMake(Margin, Margin, ScreenWidth-Margin*2, 92.f);
    view.backgroundColor = [UIColor colorWithRed:248.f/255.f green:248.f/255.f blue:248.f/255.f alpha:1.0f];
    [self.contentView addSubview:view];
    
    UIImageView *teachersImageView = [[UIImageView alloc]init];
    _teachersImageView = teachersImageView;
    [view addSubview:teachersImageView];
    
    UILabel *teachersName = [[UILabel alloc]init];
    _teachersName = teachersName;
    teachersName.font = Bigtitle;
    [view addSubview:teachersName];
    
    UILabel *teachersSeniority = [[UILabel alloc]init];
    _teachersSeniority = teachersSeniority;
    teachersSeniority.font =Smalltitle;
    teachersSeniority.textColor = [UIColor colorWithRed:67.f/255.f green:137.f/255.f blue:160.f/255.f alpha:1.0f];
    [view addSubview:teachersSeniority];
    
    UILabel *teachersSubject = [[UILabel alloc]init];
    _teachersSubject = teachersSubject;
    teachersSubject.font = Bigtitle;
    [view addSubview:teachersSubject];
    
    UILabel *teteachersInfor = [[UILabel alloc]init];
    _teachersInfor = teteachersInfor;
    teteachersInfor.font = Smalltitle;
    teteachersInfor.textColor = [UIColor colorWithRed:166.f/255.f green:166.f/255.f blue:166.f/255.f alpha:1.0f];
    [view addSubview:teteachersInfor];
    
    UILabel *teachersprice = [[UILabel alloc]init];
    _teachersprice = teachersprice;
    teachersprice.font = Bigtitle;
    [view addSubview:teachersprice];

}

-(void)layoutSubviews{
    [super layoutSubviews];
    _teachersImageView.frame = CGRectMake(Margin, Margin, 76.f, 76.f);
    _teachersName.frame = CGRectMake(_teachersImageView.right+Margin, _teachersImageView.top, 100.f, 15.f);
    _teachersSeniority.frame = CGRectMake(_teachersName.left, _teachersName.bottom+SMargin, 100.f, 15.f);
    _teachersSubject.frame = CGRectMake(_teachersSeniority.left, _teachersSeniority.bottom+SMargin, 100.f, 15.f);
    _teachersInfor.frame = CGRectMake(_teachersSubject.left, _teachersSubject.bottom+SMargin, 200.f, 15.f);
    _teachersprice.frame = CGRectMake(ScreenWidth-60.f, Margin, 60.f, 15.f);

}
-(void)setTeacherinfor:(HSTeacherDetailModel *)teacherinfor{
    _teacherinfor = teacherinfor;
    [self.teachersImageView setImage:[UIImage imageWithContentsOfFile:teacherinfor.icon]];
    [self.teachersName setText:teacherinfor.name];
    [self.teachersSeniority setText:teacherinfor.seniority];
    [self.teachersSubject setText:teacherinfor.subject];
    [self.teachersInfor setText:teacherinfor.infor];
    NSString* price = [NSString stringWithFormat:@"¥ %@", teacherinfor.price];
    [self.teachersprice setText:price];

}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
