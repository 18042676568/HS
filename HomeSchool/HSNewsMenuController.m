//
//  KLNewsMenuController.m
//  KnowingLife
//
//  Created by tanyang on 14/11/6.
//  Copyright (c) 2014年 tany. All rights reserved.
//

#import "HSNewsMenuController.h"
#import "REMenu.h"    //下拉菜单的第三方框架
#import "HSNewsViewController.h"
//#import "UIBarButtonItem+WB.h"

@interface HSNewsMenuController ()
@property (nonatomic, strong) REMenu *menu;
@end

#define baiduNewUrl @"http://jiaoyu.baidu.com"
#define hujiangNewUrl @"http://www.hjclass.com"
#define zhihuNewUrl @"http://www.zhihu.com"
#define yiqizuoyeNewUrl @"http://www.17zuoye.com"
#define wangyiNewUrl @"http://study.163.com"
@implementation HSNewsMenuController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    // 添加右导航按钮
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"navigationbar_more"] style:UIBarButtonItemStyleDone target:self action:@selector(selectMoreNews)];
    
    // 设置背景
    UIImageView *backgroundView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"beijing3"]];
    backgroundView.frame = self.view.bounds;
    [self.view addSubview:backgroundView];
    
    // 设置menuview
    [self setupMenuView];
}

// 视图将出现
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    if (![self.menu isOpen]) {
        [self.menu showInView:self.view];
    }
}

// 视图将消失
- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    
    if ([self.menu isOpen]) {
        [self.menu close];
    }
}

// 显示菜单
- (void)selectMoreNews
{
    if (![self.menu isOpen]) {
        [self.menu showInView:self.view];
    }
}

#pragma mark 设置menuview
- (void)setupMenuView
{
    // 消除block强引用
    __typeof (self) __weak weakSelf = self;
    REMenuItem *baiduItem = [[REMenuItem alloc] initWithTitle:@"百度教育"
                                                     subtitle:@"百度教育网站囊括了课程、机构、考试等信息。"
                                                        image:nil
                                             highlightedImage:nil
                                                       action:^(REMenuItem *item) {
                                                           [weakSelf pushViewControllerWithUrl:baiduNewUrl];
                                                       }];
    REMenuItem *hujiangItem = [[REMenuItem alloc] initWithTitle:@"沪江网校"
                                                    subtitle:@"英语入门、出国留学、商务英语、日语能力考、韩语、法语入门、德西泰意等十种以上语言的外语类课程，还有职场技能课程、兴趣提升以及中小幼辅导等多类型在线课程。"
                                                       image:nil
                                            highlightedImage:nil
                                                      action:^(REMenuItem *item) {
                                                          [weakSelf pushViewControllerWithUrl:hujiangNewUrl];
                                                      }];
    REMenuItem *zhihuItem = [[REMenuItem alloc] initWithTitle:@"知乎"
                                                    subtitle:@"与世界分享你的知识、经验和见解"
                                                       image:nil
                                            highlightedImage:nil
                                                      action:^(REMenuItem *item) {
                                                          [weakSelf pushViewControllerWithUrl:zhihuNewUrl];
                                                      }];
    REMenuItem *yiqiItem = [[REMenuItem alloc] initWithTitle:@"一起作业"
                                                      subtitle:@"世界领先的师生家长互动作业平台和智能英语练习平台"
                                                         image:nil
                                              highlightedImage:nil
                                                        action:^(REMenuItem *item) {
                                                            [weakSelf pushViewControllerWithUrl:yiqizuoyeNewUrl];
                                                        }];
    REMenuItem *wangyiItem = [[REMenuItem alloc] initWithTitle:@"网易云课堂"
                                                      subtitle:@"网易视频公开课频道推出国内外名校公开课"
                                                         image:nil
                                              highlightedImage:nil
                                                        action:^(REMenuItem *item) {
                                                            [weakSelf pushViewControllerWithUrl:wangyiNewUrl];
                                                        }];
    
    self.menu = [[REMenu alloc] initWithItems:@[baiduItem ,hujiangItem , zhihuItem, yiqiItem, wangyiItem]];
    
    self.menu.liveBlur = YES;
    //self.menu.liveBlurBackgroundStyle = REMenuLiveBackgroundStyleDark;
    self.menu.liveBlurTintColor=[UIColor colorWithRed:152.f/255.f green:243.f/255.f blue:255.f/255.f alpha:0.8f];
    self.menu.textColor = [UIColor whiteColor];
    self.menu.subtitleTextColor = [UIColor  blackColor];
    
    
    [self.menu showInView:self.view];
}

- (void)pushViewControllerWithUrl:(NSString *)url
{
    HSNewsViewController *newCtrl = [[HSNewsViewController alloc]init];
    newCtrl.url = url;
    [self.navigationController pushViewController:newCtrl animated:YES];
}

@end
