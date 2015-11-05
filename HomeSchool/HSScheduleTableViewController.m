//
//  HSScheduleTableViewController.m
//  HomeSchool
//
//  Created by neuedu on 15/9/16.
//  Copyright (c) 2015年 neuedu. All rights reserved.
//

#import "HSScheduleTableViewController.h"
#import "HSScheduleCellTableViewCell.h"
#import <Parse/Parse.h>
#import "CoreDataMngTool.h"
#import "Lesson.h"
#import "HSScheduleHeadView.h"

@interface HSScheduleTableViewController ()
@property(strong,nonatomic)NSArray *lessons;
@end

@implementation HSScheduleTableViewController
-(NSArray *)lessons{
    if (_lessons == nil) {
        _lessons = [NSArray array];
        _lessons = [CoreDataMngTool serachLessons];
    }
    return _lessons;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self getClassLessons];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)getClassLessons{
    PFQuery *query = [PFQuery queryWithClassName:@"lessons"];
    
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        //3
        if (!error) {
            //Everything was correct, put the new objects and load the wall
            self.lessons = nil;
            NSArray * arr= [[NSArray alloc] initWithArray:objects];
            for (int i = 0; i<arr.count; i++) {
                [Lesson lessonWithDict:arr[i]];
            }
            //self.lessons = nil;
            [self.tableView reloadData];
            
        } else {
            
            //4
            NSString *errorString = [[error userInfo] objectForKey:@"error"];
            UIAlertView *errorAlertView = [[UIAlertView alloc] initWithTitle:@"Error" message:errorString delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
            [errorAlertView show];
        }
    }];

}
#pragma mark - Table view data source

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 160;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 40;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    Lesson *l = self.lessons[section];
    HSScheduleHeadView *title = [HSScheduleHeadView scheduleHeadViewWithTitle:l.time];
    return title;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return self.lessons.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"lessonCell";
    HSScheduleCellTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[HSScheduleCellTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    //cell.classModel
    cell.classModel = self.lessons[indexPath.section];
    return cell;

}


@end
