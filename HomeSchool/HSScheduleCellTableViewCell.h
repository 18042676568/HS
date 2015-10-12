//
//  HSScheduleCellTableViewCell.h
//  HomeSchool
//
//  Created by neuedu on 15/9/16.
//  Copyright (c) 2015年 neuedu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HSClassModel.h"

@interface HSScheduleCellTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *lesson;
@property (weak, nonatomic) IBOutlet UILabel *teacher;
@property (weak, nonatomic) IBOutlet UILabel *time;
@property (weak, nonatomic) IBOutlet UILabel *address;

@property (strong,nonatomic)HSClassModel *classModel;
@end
