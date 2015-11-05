//
//  HSScheduleCellTableViewCell.m
//  HomeSchool
//
//  Created by neuedu on 15/9/16.
//  Copyright (c) 2015年 neuedu. All rights reserved.
//

#import "HSScheduleCellTableViewCell.h"
#import "UIView+Extension.h"

#define Margin 15.f
#define ScreenWidth [UIScreen mainScreen].bounds.size.width
#define ScreenHeight [UIScreen mainScreen].bounds.size.height
#define Bigtitle [UIFont systemFontOfSize:15.f]


@implementation HSScheduleCellTableViewCell
-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    if (self) {
        [self addContentSubviews];
    }
    return self;

}
-(void)addContentSubviews{
    UILabel *teachersName = [[UILabel alloc]init];
    _lesson = teachersName;
    teachersName.text =@"课程:";
    teachersName.font = Bigtitle;
    [self.contentView addSubview:teachersName];
    
    UILabel *teachersSeniority = [[UILabel alloc]init];
    _teacher = teachersSeniority;
    _teacher.text =@"老师:";
    teachersSeniority.font =Bigtitle;
    [self.contentView addSubview:teachersSeniority];
    
    UILabel *teachersSubject = [[UILabel alloc]init];
    _time = teachersSubject;
    _time.text =@"时间:";
    teachersSubject.font = Bigtitle;
    [self.contentView addSubview:teachersSubject];
    
    UILabel *teteachersInfor = [[UILabel alloc]init];
    _address = teteachersInfor;
    _address.text =@"地点:";
    _address.font = Bigtitle;
    [self.contentView addSubview:teteachersInfor];
    
    UILabel *teachersName1 = [[UILabel alloc]init];
    _lesson1 = teachersName1;
    teachersName1.font = Bigtitle;
    [self.contentView addSubview:teachersName1];
    
    UILabel *teachersSeniority1 = [[UILabel alloc]init];
    _teacher1 = teachersSeniority1;
    teachersSeniority1.font =Bigtitle;
    [self.contentView addSubview:teachersSeniority1];
    
    UILabel *teachersSubject1 = [[UILabel alloc]init];
    _time1 = teachersSubject1;
    teachersSubject1.font = Bigtitle;
    [self.contentView addSubview:teachersSubject1];
    
    UILabel *teteachersInfor1 = [[UILabel alloc]init];
    _address1 = teteachersInfor1;
    teteachersInfor1.font = Bigtitle;
    [self.contentView addSubview:teteachersInfor1];
}
- (void)layoutSubviews{
    [super layoutSubviews];
    _lesson.frame = CGRectMake(ScreenWidth*0.10, Margin, 60, 20);
    _lesson1.frame = CGRectMake(_lesson.right+Margin, _lesson.top, ScreenWidth*0.7-80, 20);
    _teacher.frame = CGRectMake(ScreenWidth*0.10, Margin+_lesson.bottom, 60, 20);
    _teacher1.frame = CGRectMake(_lesson.right+Margin, _teacher.top, ScreenWidth*0.7-80, 20);
    _time.frame = CGRectMake(ScreenWidth*0.10, Margin+_teacher.bottom, 60, 20);
    _time1.frame = CGRectMake(_lesson.right+Margin, _time.top, ScreenWidth*0.7-80, 20);
    _address.frame = CGRectMake(ScreenWidth*0.10, Margin+_time.bottom, 60, 20);
    _address1.frame = CGRectMake(_lesson.right+Margin, _address.top, ScreenWidth*0.7-80, 20);
    
}
-(void)setClassModel:(Lesson *)classModel{
    _classModel = classModel;
    _teacher1.text = classModel.teacher;
    _time1.text = classModel.time;
    _address1.text = classModel.address;
    _lesson1.text = classModel.lesson;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
