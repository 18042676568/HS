//
//  HSScheduleCellTableViewCell.h
//  HomeSchool
//
//  Created by neuedu on 15/9/16.
//  Copyright (c) 2015年 neuedu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Lesson.h"

@interface HSScheduleCellTableViewCell : UITableViewCell
@property (weak, nonatomic) UILabel *lesson;
@property (weak, nonatomic) UILabel *teacher;
@property (weak, nonatomic) UILabel *time;
@property (weak, nonatomic) UILabel *address;
@property (weak, nonatomic) UILabel *lesson1;
@property (weak, nonatomic) UILabel *teacher1;
@property (weak, nonatomic) UILabel *time1;
@property (weak, nonatomic) UILabel *address1;


@property (strong,nonatomic)Lesson *classModel;
@end
