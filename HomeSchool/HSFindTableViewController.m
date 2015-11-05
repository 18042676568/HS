//
//  HSFindViewController.m
//  HomeSchool
//
//  Created by neuedu on 15/10/27.
//  Copyright (c) 2015年 neuedu. All rights reserved.
//

#import "HSFindTableViewController.h"
#import "HSFindTableCell.h"
#import "RRSendMessageViewController.h"
#import <MJRefresh.h>
#import <MBProgressHUD.h>
#import "MBProgressHUD+MoreExtentions.h"
#import "AppDelegate.h"
#import "QQChatMsgBar.h"

@interface HSFindTableViewController ()
@property (assign,nonatomic)CGFloat cellHight;
@property (strong,nonatomic)NSMutableArray *messageList;
@property (strong,nonatomic)QQChatMsgBar *msgBar;
@property (copy,nonatomic)NSString *commentObjectId;
@property (strong,nonatomic)HSFindTableCell *commentCell;
@end

@implementation HSFindTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]
                                              initWithBarButtonSystemItem:UIBarButtonSystemItemCamera target:self action:@selector(newMessage)];
    _messageList = [NSMutableArray array];
    self.tableView.header =
    [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(getMessages)];
    [self.tableView.header beginRefreshing];
    
    self.tableView.footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(getMessages)];
    [self.tableView.footer beginRefreshing];
    
    
    QQChatMsgBar *msgBar = [QQChatMsgBar qqChatMsgBar];
    _msgBar = msgBar;
    msgBar.delegate = self;
    msgBar.frame =  CGRectMake(0, self.view.frame.size.height, self.view.frame.size.width, 44);

    [[UIApplication sharedApplication].keyWindow addSubview:_msgBar];
    //[[UIApplication sharedApplication].keyWindow bringSubviewToFront:_msgBar];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardChanged:)
                                                 name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardChanged:)
                                                 name:UIKeyboardWillHideNotification object:nil];
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}

-(void)keyboardChanged:(NSNotification*)notify{
    //NSLog(@"%@",notify.name);
    if ([notify.name isEqualToString:UIKeyboardWillShowNotification]) {
        NSDictionary *userInfo = notify.userInfo;
        NSString *duration = [userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey];
        CGRect endRect = [[userInfo objectForKey:UIKeyboardFrameEndUserInfoKey]CGRectValue];
        //NSLog(@"%f %f",[duration floatValue],endRect.origin.y);
        
        //执行动画让发送bar跟随keyboard变化
        [UIView animateWithDuration:[duration floatValue] animations:^{
            _msgBar.frame = CGRectMake(0, endRect.origin.y-44.f,_msgBar.frame.size.width, _msgBar.frame.size.height);
        }];
    }else {
        NSDictionary *userInfo = notify.userInfo;
        NSString *duration = [userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey];
        CGRect endRect = [[userInfo objectForKey:UIKeyboardFrameEndUserInfoKey]CGRectValue];
        //NSLog(@"%f %f",[duration floatValue],endRect.origin.y);
        
        //执行动画让发送bar跟随keyboard变化
        [UIView animateWithDuration:[duration floatValue] animations:^{
            _msgBar.frame = CGRectMake(0, endRect.origin.y,_msgBar.frame.size.width, _msgBar.frame.size.height);
        }];

    }
}



-(void)getMessages{
    static int num = 0;
    [MBProgressHUD showHUDAddedTo:self.view animated:YES ];
    PFQuery *query = [PFQuery queryWithClassName:@"WallImages"];
    
    [query  orderByDescending:@"createdAt"];
    query.limit = 5;
    query.skip = num;
    
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        //3
        if (!error) {
            //Everything was correct, put the new objects and load the wall
            [MBProgressHUD hideHUDForView:self.view animated:YES];
            NSArray * arr= [[NSArray alloc] initWithArray:objects];
            //[self saveMessageWithArray:arr];
            for (int i=0; i<arr.count; i++) {
                
                HSFindModel *find = [HSFindModel hsFindModelWithDict:objects[i]];
                HSFindFrameModel *model = [HSFindFrameModel hsFindFrameModelWithHSFindModel:find];
                [_messageList addObject:model];
                
            }
            [self.tableView reloadData];
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
            //NSString *errorString = [[error userInfo] objectForKey:@"error"];
            [MBProgressHUD showTipToWindow:@"网络连接有问题 请检查网络"];
            [self.tableView.header endRefreshing];
            [self.tableView.footer endRefreshing];
        }
    }];
    
    num +=5;
    
}

-(void)newMessage{
    // NSLog(@"das");
    RRSendMessageViewController * controller = [[RRSendMessageViewController alloc]init];
    [controller presentController:self :^(RRMessageModel *model, BOOL isCancel) {
        if (isCancel == true) {
            //self.message.text = @"";
        }
        else {
            [self uploadWithModel:model];
        }
        
        [controller dismissViewControllerAnimated:YES completion:nil];
    }];
    
}

#pragma mark 发动态
-(void)uploadWithModel:(RRMessageModel *)model{
    
    NSMutableArray *array = [NSMutableArray array];
    for (int i=0; i<model.photos.count; i++) {
        NSData* pictureData  = UIImagePNGRepresentation(model.photos[i]);
        PFFile *file = [PFFile fileWithName:[NSString stringWithFormat:@"img_%d",i] data:pictureData];
        [file saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error){
            if (succeeded){
                //2
                //Add the image to the object, and add the comment and the user
                [array addObject:file];
                if (array.count == model.photos.count) {
                    PFObject *imageObject = [PFObject objectWithClassName:@"WallImages"];
                    [imageObject addObject:array forKey:@"images"];
                    [imageObject setObject:[PFUser currentUser].username forKey:@"user"];
                    [imageObject setObject:model.text forKey:@"text"];
                    
                    //3
                    [imageObject saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
                        //4
                        if (succeeded){
                            HSFindModel *find = [HSFindModel hsFindModelWithDict:imageObject];
                            HSFindFrameModel *model = [HSFindFrameModel hsFindFrameModelWithHSFindModel:find];
                            [_messageList insertObject:model atIndex:0];
                            [self.tableView reloadData];
                                                    
                            [imageObject fetchInBackground];
                            //Go back to the wall
                            //[self.navigationController popViewControllerAnimated:YES];
                            NSLog(@"upload Success");
                        }
                        else{
                            //NSString *errorString = [[error userInfo] objectForKey:@"error"];
                            [MBProgressHUD showTipToWindow:@"网络连接有问题 请检查网络"];
                        }
                    }];
                    
                }
            }
            else{
                
                [MBProgressHUD showTipToWindow:@"网络连接有问题 请检查网络"];
            }
        } progressBlock:^(int percentDone) {
            NSLog(@"Uploaded: %d %%", percentDone);
            
        }];
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
//{
//    [super touchesBegan:touches withEvent:event];//
//    [self.view endEditing:YES];
//}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    // Return the number of rows in the section.
    return self.messageList.count;
}

#pragma mark 点赞
-(void)findtableViewCell:(HSFindTableCell *)cell withObjectId:(NSString *)objectId{
    PFQuery *query = [PFQuery queryWithClassName:@"WallImages"];
    // Retrieve the object by id
    [query getObjectInBackgroundWithId:objectId block:^(PFObject *message, NSError *error) {
        if (!error) {
            [message addObject:[PFUser currentUser].username forKey:@"praises"];
            //[message[@"praises"]]
            
            [message saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error){
                if (succeeded) {
                    NSIndexPath *indexPath = [self.tableView indexPathForCell:cell];
                    HSFindFrameModel *findframe = self.messageList[indexPath.row];
                    
                    HSFindModel *find = findframe.find;
                    if (find.praise.length == 0) {
                        find.praise = @"     ";
                    }
                    find.praise = [NSString stringWithFormat:@"%@,%@",find.praise,[PFUser currentUser].username];
                    NSLog(@"%@",find.praise);
                    HSFindFrameModel *findf = [HSFindFrameModel hsFindFrameModelWithHSFindModel:find];
                    [self.messageList removeObjectAtIndex:indexPath.row];
                    [self.messageList insertObject:findf atIndex:indexPath.row];
                    [self.tableView reloadRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationNone];

                    [message fetchInBackground];
                    NSLog(@"----");
                }
            }];
            
        }
        else {
            [MBProgressHUD showTipToWindow:@"网络连接有问题 请检查网络"];
        }
        
    }];
}

#pragma mark 评论
-(void)commentWithTableViewCell:(HSFindTableCell *)cell withObjectId:(NSString *)objectId{
    // Retrieve the object by id
    [_msgBar.messagetext becomeFirstResponder];
    _commentObjectId = objectId;
    _commentCell = cell;
    
}

-(void)didSEnderMsgCick:(NSString *)str{
    [self.view.window endEditing:YES];
    PFQuery *query = [PFQuery queryWithClassName:@"WallImages"];
    NSDictionary *comment = @{[PFUser currentUser].username:str};
    [query getObjectInBackgroundWithId:_commentObjectId block:^(PFObject *message, NSError *error) {
        [message addObject:comment forKey:@"comments"];
        [message saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error){
            if (succeeded) {
                
                [message fetchInBackground];
                NSLog(@"----");
            }
        }];
        //NSLog(@"----");
        NSIndexPath *indexPath = [self.tableView indexPathForCell:_commentCell];
        HSFindFrameModel *findframe = self.messageList[indexPath.row];
        
        HSFindModel *find = findframe.find;
        //find.praise = [NSString stringWithFormat:@"%@,%@",find.praise,[PFUser currentUser].username];
        [find.comments addObject:comment];
        //NSLog(@"%@",find.praise);
        HSFindFrameModel *findf = [HSFindFrameModel hsFindFrameModelWithHSFindModel:find];
        [self.messageList removeObjectAtIndex:indexPath.row];
        [self.messageList insertObject:findf atIndex:indexPath.row];
        [self.tableView reloadRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationNone];
    }];

}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self.view.window endEditing:YES];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifier = @"findCell";
    HSFindTableCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[HSFindTableCell alloc] initWithStyle:UITableViewCellStyleDefault
                                      reuseIdentifier:cellIdentifier];
    }
    HSFindFrameModel *model = self.messageList[indexPath.row];
    cell.findFrame = model;
    cell.delegate = self;
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    HSFindFrameModel *model = self.messageList[indexPath.row];
    return model.cellHeight;
}
@end
