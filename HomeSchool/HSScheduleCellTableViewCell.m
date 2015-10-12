//
//  HSScheduleCellTableViewCell.m
//  HomeSchool
//
//  Created by neuedu on 15/9/16.
//  Copyright (c) 2015年 neuedu. All rights reserved.
//

#import "HSScheduleCellTableViewCell.h"


@implementation HSScheduleCellTableViewCell

- (void)awakeFromNib {
    // Initialization code
    
}

-(void)setClassModel:(HSClassModel *)classModel{
    _classModel = classModel;
    _teacher.text = classModel.teacher;
    _time.text = classModel.time;
    _address.text = classModel.classAdd;
    _lesson.text = classModel.lesson;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
