//
//  HSteacherinfoTableViewCell.h
//  night
//
//  Created by neuedu on 15/10/12.
//  Copyright (c) 2015年 neuedu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIView+Extension.h"
#import "HSteacherinforModel.h"
#import "HSTeacherDetailModel.h"


@interface HSteacherinfoTableViewCell : UITableViewCell
//老师照片
@property(weak,nonatomic)UIImageView* teachersImageView;
//老师姓名
@property(weak,nonatomic)UILabel*teachersName;
//老师教龄
@property(weak,nonatomic)UILabel*teachersSeniority;
//老师所教的科目
@property(weak,nonatomic)UILabel*teachersSubject;
//老师的简介
@property(weak,nonatomic)UILabel*teachersInfor;
//老师的价格
@property(weak,nonatomic)UILabel*teachersprice;

//@property(strong,nonatomic)HSteacherinforModel*teacherinfor;

@property(strong,nonatomic)HSTeacherDetailModel *teacherinfor;

//+(instancetype )teacherinfoTableViewCellWithTable:(UITableView*)tableView;
@end
