//
//  HSFindTableCell.h
//  HomeSchool
//
//  Created by neuedu on 15/10/27.
//  Copyright (c) 2015年 neuedu. All rights reserved.
//

#import <Parse/Parse.h>
#import "HSFindFrameModel.h"

@class HSFindTableCell;
@protocol HSFindTableCellDelegate <NSObject>

@optional
-(void)findtableViewCell:(HSFindTableCell *)cell withObjectId:(NSString *)objectId;
-(void)commentWithTableViewCell:(HSFindTableCell *)cell withObjectId:(NSString *)objectId;
@end

@interface HSFindTableCell : UITableViewCell
//头像
@property (weak,nonatomic)UIImageView *icon;
//名字
@property (weak,nonatomic)UILabel *name;
//正文
@property (weak,nonatomic)UILabel *text;
//图片 9宫格 做一个可变数组 保存0～9个配图
@property (strong,nonatomic)NSMutableArray *pics;
@property (weak,nonatomic)UILabel *time;
@property (weak,nonatomic)UIButton *commentButton;
@property (weak,nonatomic)UIView *comment;

@property (weak,nonatomic)UIView *praise;
@property (weak,nonatomic)UIImageView *zan;
@property (weak,nonatomic)UILabel *p;
//@property (strong,nonatomic)NSMutableArray *comments;
@property (weak,nonatomic)UILabel *comm;
//拥
@property (strong,nonatomic)HSFindFrameModel *findFrame;

@property (weak,nonatomic)id<HSFindTableCellDelegate>delegate;
@end
