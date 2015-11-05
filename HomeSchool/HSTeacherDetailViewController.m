//
//  HSTeacherDetailViewController.m
//  HomeSchool
//
//  Created by neuedu on 15/10/14.
//  Copyright (c) 2015年 neuedu. All rights reserved.
//

#import "HSTeacherDetailViewController.h"
#import "HSTeacherDetailModel.h"
@interface HSTeacherDetailViewController ()
@end

@implementation HSTeacherDetailViewController


//-(NSMutableArray*)detail{
//    if (_detail == nil) {
//        _detail = [NSMutableArray array];
//        NSArray *dictsList = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"HSTeacherdetail" ofType:@"plist"
//                                                               ]];
//        
//        
//        
//        
//        for (int  i=0; i<dictsList.count; i++) {
//            HSTeacherDetailModel *teacherdetail = [HSTeacherDetailModel hsteacherDetailModelWithDict:dictsList[i]];
//            [_detail addObject:teacherdetail];
//        }
//        
//    }
//    return _detail;
//
//}
- (void)viewDidLoad {
    [super viewDidLoad];
    UIScrollView *scroll = [[UIScrollView alloc]init];
    scroll.frame =CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height);
    scroll.delegate = self;
    scroll.contentSize =CGSizeMake([UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
    [self.view addSubview:scroll];
    
    [scroll addSubview:[self setheadView]];
    
    UITableView * tableView = [[UITableView alloc]init];
    tableView.frame =CGRectMake(0, 150.f,[UIScreen mainScreen].bounds.size.width,[UIScreen mainScreen].bounds.size.height-150.f);
    //_tableView = tableView;
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [scroll addSubview:tableView];
    tableView.dataSource = self;
    tableView.delegate = self;
    
    self.title = @"老师详情";

}

- (UIView *)setheadView{
    UIView * views = [[UIView alloc]init];
    views.frame =CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 150.f);
    views.backgroundColor = [UIColor grayColor];
    
    UIImageView *imageView = [[UIImageView alloc]init];
    imageView.frame = CGRectMake(([UIScreen mainScreen].bounds.size.width-44.f)*0.5,30.f, 44.f, 44.f);
    [imageView setImage:[UIImage imageNamed:_detail.icon]];
    //icon头像变成圆形
    imageView.layer.masksToBounds =YES;
    imageView.layer.cornerRadius = imageView.bounds.size.width*0.5;
    imageView.layer.borderWidth = 0.5;
    imageView.layer.borderColor = [UIColor grayColor].CGColor;
    [views addSubview:imageView];
    
    UILabel *name = [[UILabel alloc]init];
    name.frame = CGRectMake(([UIScreen mainScreen].bounds.size.width-40.f)*0.5, 64.f+20.f, 40.f, 20.f);
    [name setText:_detail.name];
    name.font = [UIFont systemFontOfSize:14.f];
    name.textAlignment =NSTextAlignmentCenter;
    [views addSubview:name];
    UILabel *Introduction = [[UILabel alloc]init];
    Introduction.frame = CGRectMake(([UIScreen mainScreen].bounds.size.width-300.f)*0.5, 20.f+20.f+64.f, 300.f, 20.f);
    [Introduction setText:_detail.Introduction];
    Introduction.font = [UIFont systemFontOfSize:14.f];
    //文本居中
    Introduction.textAlignment = NSTextAlignmentCenter;
    [views addSubview:Introduction];
    return views;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 3;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    switch (section) {
        case 0:
            return 2;
            break;
        case 1:
            return 1;
            break;
        case 2:
            return 1;
            break;
        default:
            return 0;
            break;
    }
    

}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    switch (section) {
        case 0:
            return @"基本信息";
            break;
        case 1:
            return @"过往经历";
            break;
        case 2:
            return @"联系方式";
            break;
        default:
            break;
    }
    return @"基本信息";
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = (UITableViewCell*)[tableView  dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]
                initWithStyle:UITableViewCellStyleDefault
                reuseIdentifier:CellIdentifier];
    }
    //HSTeacherDetailModel*detailModel = self.detail[0];
    switch (indexPath.section) {
        case 0:
        {
            if (indexPath.row == 0) {
                NSString *location = [NSString stringWithFormat:@"位置: %@",_detail.location];
                cell.textLabel.text = location;
            }else if(indexPath.row == 1){
                NSString *seniority = [NSString stringWithFormat:@"学科: %@",_detail.subject];
                cell.textLabel.text = seniority;
            }
        }
            break;
        case 1:
        {
            if (indexPath.row == 0) {
                NSString*feature = [NSString stringWithFormat:@"特点: %@",_detail.feature];
                cell.textLabel.text = feature;
            }
            
        }
            break;
        case 2:
        {
            if (indexPath.row == 0) {
                NSString*Contact = [NSString stringWithFormat:@"联系方式: %@",_detail.Contact];
                cell.textLabel.text = Contact;
            }
            
        }
            break;
            
        default:
            break;
    }
    return cell;
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 44.f;

}
@end
