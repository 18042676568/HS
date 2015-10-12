//
//  TableViewController.m
//  UI12 - WechatMoment - 150824
//
//  Created by neuedu on 15/8/24.
//  Copyright (c) 2015年 neuedu. All rights reserved.
//

#import "TableViewController.h"
#import "WechatViewCell.h"
#import "WechatModel.h"
#import "WechatFrameModel.h"
#import "WechatHeaderView.h"

@interface TableViewController ()


@property (strong,nonatomic) NSMutableArray * wechats;
@property (assign,nonatomic) NSUInteger number;

@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    _number = 5;
    self.tableView.contentInset = UIEdgeInsetsMake(20, 0, 0, 0);
    
    WechatHeaderView * headerView = [WechatHeaderView wechatHeaderView];
    self.tableView.tableHeaderView = headerView;
    
    WechatFooterView * footerView = [WechatFooterView wechatFooterView];
    self.tableView.tableFooterView = footerView;
    footerView.delegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSMutableArray *)wechats{
    if (_wechats == nil) {
        _wechats = [NSMutableArray array];
        NSArray * dictArray = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"weichat" ofType:@"plist"]];
        for (int i = 0; i<dictArray.count; i++) {
            NSDictionary * dict = dictArray[i];
            WechatModel * wechat = [WechatModel wecharModelWithDictionary:dict];
            WechatFrameModel * wechatFrame = [WechatFrameModel wechatFrameModelWithWechatModel:wechat];
            [_wechats addObject:wechatFrame];
            
        }
    }
    return _wechats;
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return _number;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    WechatViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"CellType1" forIndexPath:indexPath];
    
    WechatFrameModel * wechatFrame = self.wechats[indexPath.row];
    cell.wechatFrame = wechatFrame;
    
    return cell;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    WechatFrameModel * wechatFrame = self.wechats[indexPath.row];
    
    return wechatFrame.cellHeight;
}

-(void)didMoreLoad:(UIButton *)sender{
    NSUInteger count = _number;
    if (count < self.wechats.count) {
        for (NSUInteger i = count; i<count + 2; i++) {
            _number = _number + 1;
            if (_number == self.wechats.count) {
                
                break;
            }
            
            
        }
        [self.tableView reloadData];
    }else{
        sender.enabled = NO;
        [sender setTitle:@"没有更多数据" forState:UIControlStateDisabled];
        [sender setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    }
}
/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
