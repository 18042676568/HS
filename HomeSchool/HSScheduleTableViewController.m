//
//  HSScheduleTableViewController.m
//  HomeSchool
//
//  Created by neuedu on 15/9/16.
//  Copyright (c) 2015年 neuedu. All rights reserved.
//

#import "HSScheduleTableViewController.h"
#import "HSScheduleCellTableViewCell.h"
#import "HSClassModel.h"

@interface HSScheduleTableViewController ()

@end

@implementation HSScheduleTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        return 20;
    }
    if (indexPath.row == 1 || indexPath.row == 3||indexPath.row == 5) {
        return 50;
    } else {
        return 123;
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return 7;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell;
    
    if (indexPath.row == 0) {
        cell = [[UITableViewCell alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 20)];
    }
    else if (indexPath.row == 1)
    {
        cell = [tableView dequeueReusableCellWithIdentifier:@"ScheduleTimeCell"];
    }
    else if (indexPath.row == 3)
    {
        cell = [tableView dequeueReusableCellWithIdentifier:@"ScheduleTimeCell"];
        
    }
    else if (indexPath.row == 5)
    {
        cell = [tableView dequeueReusableCellWithIdentifier:@"ScheduleTimeCell"];
    }

    else
    {
        HSScheduleCellTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ScheduleDateCell"];
        //cell.classModel =
        return cell;
    }
    
    return cell;
}


@end
