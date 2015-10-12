//
//  TgHeaderView.h
//  UI11-团购
//
//  Created by hegf on 15/8/21.
//  Copyright (c) 2015年 hegf. All rights reserved.
//
#import <Parse/Parse.h>
#import <UIKit/UIKit.h>

@interface TgHeaderView : UIView<UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *scrowView;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;

@property (strong, nonatomic) NSArray* wallObjectsArray;
@property (strong, nonatomic) NSMutableArray* adPicturesArray;


@property (strong, nonatomic) NSTimer* timer;

+(instancetype)tgHeaderView;
@end
