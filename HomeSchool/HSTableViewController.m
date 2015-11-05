//
//  HSTableViewController.m
//  night
//
//  Created by neuedu on 15/10/12.
//  Copyright (c) 2015年 neuedu. All rights reserved.
//

#import "HSTableViewController.h"
#import "HSTeacherDetailViewController.h"
#import "HSteacherinforModel.h"
#import "MBProgressHUD.h"
#import <Parse/Parse.h>
#import "HSTeacherDetailModel.h"
#import <MJRefresh.h>

@interface HSTableViewController ()
@property(strong,nonatomic)NSMutableArray*hsteacherinforList;
@end

@implementation HSTableViewController
//-(NSMutableArray *)hsteacherinforList{
//    if (_hsteacherinforList == nil) {
//        _hsteacherinforList = [NSMutableArray array];
//        NSArray *dictList = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"HSteacherinfor.plist" ofType:nil]];
//        for (int  i=0; i<dictList.count; i++) {
//            HSteacherinforModel*teacherinfor = [HSteacherinforModel hsteacherinforModelWithDict:dictList[i]];
//            [_hsteacherinforList addObject:teacherinfor];
//        }
//        
//    }
//    return _hsteacherinforList;
//
//}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _hsteacherinforList = [NSMutableArray array];
   // [self getTeacherLists];
    
    self.tableView.header =
    [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(getTeacherLists)];
    [self.tableView.header beginRefreshing];
    
    self.tableView.footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(getTeacherLists)];
    [self.tableView.footer beginRefreshing];
    
}

//获取服务器信息
-(void)getTeacherLists{
    static int num = 0;
    [MBProgressHUD showHUDAddedTo:self.view animated:YES ];
    PFQuery *query = [PFQuery queryWithClassName:@"Teachers"];
    
    [query  orderByAscending:@"createdAt"];
    query.limit = 5;
    query.skip = num;
    
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        //3
        if (!error) {
            //Everything was correct, put the new objects and load the wall
            [MBProgressHUD hideHUDForView:self.view animated:YES];
            NSArray * arr= [[NSArray alloc] initWithArray:objects];
            [self saveImageWithArray:arr];
            
            if (arr.count<5) {
                [self.tableView.footer noticeNoMoreData];
                
                [self.tableView reloadData];
            }else{
            
            [self.tableView.footer endRefreshing];
            }
            [self.tableView.header endRefreshing];
        } else {
            [MBProgressHUD hideHUDForView:self.view animated:YES]; 
            //4
            NSString *errorString = [[error userInfo] objectForKey:@"error"];
            UIAlertView *errorAlertView = [[UIAlertView alloc] initWithTitle:@"Error" message:errorString delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
            [errorAlertView show];
            [self.tableView.header endRefreshing];
            [self.tableView.footer endRefreshing];
        }
    }];
    
    num +=5;
}

//老师头像处理
-(void)saveImageWithArray:(NSArray *)array{
   
    for (int i = 0;i <array.count;i++){
        //Add the image
        PFFile *image = (PFFile *)[array[i] objectForKey:@"icon"];
        NSString *name = (NSString *)[array[i] objectForKey:@"name"];
        NSString *price = (NSString *)[array[i] objectForKey:@"price"];
        NSString *subject = (NSString *)[array[i] objectForKey:@"subject"];
        NSString *seniority = (NSString *)[array[i] objectForKey:@"seniority"];
        NSString *infor = (NSString *)[array[i] objectForKey:@"infor"];
        NSString *location = (NSString *)[array[i] objectForKey:@"location"];
        NSString *feature = (NSString *)[array[i] objectForKey:@"feature"];
        NSString *Contact = (NSString *)[array[i] objectForKey:@"Contact"];
        NSString *Introduction = (NSString *)[array[i] objectForKey:@"Introduction"];
        
        [image getDataInBackgroundWithBlock:^(NSData *data, NSError *error) {
            if (!error) {
                
                   dispatch_async(dispatch_get_main_queue(), ^{
                    //                    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask, YES);
                    //                    NSString *filePath = [[paths objectAtIndex:0] stringByAppendingPathComponent:[NSString stringWithFormat:@"pic_%d.png", i]]; // 保存文件的名称
                    NSString *tmp = NSTemporaryDirectory();
                    NSString *filePath = [tmp stringByAppendingPathComponent:[NSString stringWithFormat:@"pic_%d.png", i]];
                    
                    [data writeToFile: filePath atomically:YES];
                    
                    NSDictionary *dict = @{
                                           @"icon":filePath,
                                           @"name":name,
                                           @"price":price,
                                           @"subject":subject,
                                           @"seniority":seniority,
                                           @"infor":infor,
                                           @"Introduction":Introduction,
                                           @"Contact":Contact,
                                           @"location":location,
                                           @"feature":feature
                                           };
                    //HSteacherinforModel *teacher = [HSteacherinforModel hsteacherinforModelWithDict:dict];
                    HSTeacherDetailModel *teacher = [HSTeacherDetailModel hsteacherDetailModelWithDict:dict];
                    [_hsteacherinforList addObject:teacher];
                    [self.tableView reloadData];
                });
                
                
                
            } else {
                //4
                NSString *errorString = [[error userInfo] objectForKey:@"error"];
                UIAlertView *errorAlertView = [[UIAlertView alloc] initWithTitle:@"Error" message:errorString delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
                [errorAlertView show];
            }
            
        
        }];
        
    }
                       
}
                       
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100.f;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(BOOL)prefersStatusBarHidden{
    return YES;
}
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    // Return the number of rows in the section.
    return self.hsteacherinforList.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
   static NSString *ID = @"CellType1";
   HSteacherinfoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[HSteacherinfoTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    cell.teacherinfor=self.hsteacherinforList[indexPath.row];  
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
//    self.navigationController.title = @"详情";
//    [self.navigationController performSegueWithIdentifier:@"toTeacherDetail" sender:self.hsteacherinforList[indexPath.row]];
    [self performSegueWithIdentifier:@"toTeacherDetail" sender:self.hsteacherinforList[indexPath.row]];
    
    
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{

    if ([segue.destinationViewController isKindOfClass:[HSTeacherDetailViewController class]]) {
        HSTeacherDetailViewController *teach = segue.destinationViewController;
        teach.detail = sender;
        //NSLog(@"%@",sender);
    }
}

@end
