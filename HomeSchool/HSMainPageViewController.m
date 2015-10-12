//
//  HSMainPageViewController.m
//  HomeSchool
//
//  Created by neuedu on 15/9/16.
//  Copyright (c) 2015年 neuedu. All rights reserved.
//

#import "HSMainPageViewController.h"
#import <RDVTabBarController.h>
#import <RDVTabBarItem.h>

#define kTitleBarColor [UIColor colorWithRed:67.f/255.f green:137.f/255.f blue:160.f/255.f alpha:1.0f]
@interface HSMainPageViewController ()

@end

@implementation HSMainPageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIStoryboard* storyboard0 = [UIStoryboard storyboardWithName:@"HSFirst" bundle:nil];
    UINavigationController *zeroViewController = [storyboard0 instantiateViewControllerWithIdentifier:@"firstnv"];
    
    UIStoryboard* storyboard1 = [UIStoryboard storyboardWithName:@"HSContacts" bundle:nil];
    UINavigationController *contactView = [storyboard1 instantiateViewControllerWithIdentifier:@"contactsnv"];
    
    UIStoryboard* storyboard2 = [UIStoryboard storyboardWithName:@"HSSchedule" bundle:nil];
    
    UINavigationController *secondViewController = [storyboard2 instantiateViewControllerWithIdentifier:@"schedulenv"];
    
    UIStoryboard* storyboard3 = [UIStoryboard storyboardWithName:@"HSFind" bundle:nil];
    UINavigationController *thirdViewController = [storyboard3 instantiateViewControllerWithIdentifier:@"findnv"];
    
    UIStoryboard* storyboard4 = [UIStoryboard storyboardWithName:@"HSme" bundle:nil];
    UINavigationController *fifthViewController = [storyboard4 instantiateViewControllerWithIdentifier:@"menv"];
    
    [self setViewControllers:@[zeroViewController,secondViewController,contactView,thirdViewController,fifthViewController]];
    
    UIImage *finishedImage = [UIImage imageNamed:@"tabbar_selected_background"];
    UIImage *unfinishedImage = [UIImage imageNamed:@"tabbar_normal_background"];
    NSArray *tabBarItemImages = @[@"bottom_btn1", @"bottom_btn2", @"bottom_btn3", @"bottom_btn4", @"bottom_btn5"];
    NSArray *tabBarItemTitles = @[@"首页", @"课表", @"联系人",@"发现",@"我"];
    
    RDVTabBar *tabBar = [self tabBar];
    
    [tabBar setFrame:CGRectMake(CGRectGetMinX(tabBar.frame), CGRectGetMinY(tabBar.frame), CGRectGetWidth(tabBar.frame), 50)];
    
    NSInteger index = 0;
    for (RDVTabBarItem *item in [[self tabBar] items]) {
        [item setBackgroundSelectedImage:finishedImage withUnselectedImage:unfinishedImage];
        UIImage *selectedimage = [UIImage imageNamed:[NSString stringWithFormat:@"%@_pressed",
                                                      [tabBarItemImages objectAtIndex:index]]];
        UIImage *unselectedimage = [UIImage imageNamed:[NSString stringWithFormat:@"%@_normal",
                                                        [tabBarItemImages objectAtIndex:index]]];
        [item setFinishedSelectedImage:selectedimage withFinishedUnselectedImage:unselectedimage];
        
        item.title = tabBarItemTitles[index];
        
        item.selectedTitleAttributes = @{NSForegroundColorAttributeName: kTitleBarColor,
                                         NSFontAttributeName: [UIFont systemFontOfSize:12.f]};
        
        item.unselectedTitleAttributes = @{NSForegroundColorAttributeName: [UIColor grayColor],
                                           NSFontAttributeName: [UIFont systemFontOfSize:12.f]};
        
        index++;
    }
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
