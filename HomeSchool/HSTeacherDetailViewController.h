//
//  HSTeacherDetailViewController.h
//  HomeSchool
//
//  Created by neuedu on 15/10/14.
//  Copyright (c) 2015年 neuedu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HSTeacherDetailModel.h"

@interface HSTeacherDetailViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,UIScrollViewDelegate>

@property(strong,nonatomic)HSTeacherDetailModel *detail;
@end
