//
//  TgHeaderView.m
//  UI11-团购
//
//  Created by hegf on 15/8/21.
//  Copyright (c) 2015年 hegf. All rights reserved.
//

#import "TgHeaderView.h"


@implementation TgHeaderView



+(instancetype)tgHeaderView{
    TgHeaderView* tgHeaderView = [[[NSBundle mainBundle]loadNibNamed:@"TgHeaderView" owner:nil options:nil] lastObject];
    return tgHeaderView;
}

//对于xib定义的View 初始化会调用？ 对于纯代码定义的View 初始化会调用？
//Xib awakeFromNid 纯代码 init
-(void)awakeFromNib{
    [super awakeFromNib];
    
    
    
    
    
    //*
     PFQuery *query1 = [PFQuery queryWithClassName:@"Advertisement"];
     
     
     
     
     
     [query1 findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
     //3
     if (!error) {
     //Everything was correct, put the new objects and load the wall
     self.wallObjectsArray = nil;
     self.wallObjectsArray = [[NSArray alloc] initWithArray:objects];
         NSLog(@"*********________________%lu",self.wallObjectsArray.count);
     [self sub];
     
     } else {
     
     //4
     NSString *errorString = [[error userInfo] objectForKey:@"error"];
     UIAlertView *errorAlertView = [[UIAlertView alloc] initWithTitle:@"Error" message:errorString delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
     [errorAlertView show];
     }
     }];

     
     //*
    
    
    
    
    
    

}
-(void)sub{

    //设置self为scrowView的代理
    _scrowView.delegate = self;
    
    //对子控件进行初始化
    _adPicturesArray = [[NSMutableArray alloc] init];
    
    
  //  for (int i=0; i<5; i++) {
        

    for (PFObject * wallObject in self.wallObjectsArray){
        
        //Add the image
        PFFile *image = (PFFile *)[wallObject objectForKey:@"image"];
        
        
        [_adPicturesArray addObject:image];
        //   int i = 0;
        //
        //   NSString * name = [NSString stringWithFormat:@"ad_%02d",i];
        //     i++;
        
        
        
        
       // for (int i=0; i<5; i++) {
        [image getDataInBackgroundWithBlock: ^(NSData *PF_NULLABLE_S data, NSError *PF_NULLABLE_S error){
            
            if (!error) {
                for (int i=0; i<6; i++) {
                UIImageView* imageView = [[UIImageView alloc]init];
                UIImage * img = [UIImage imageWithData:data];
                     
                     
                [imageView setImage:img];
                
                
                // TgHeaderView * adView=[TgHeaderView tgHeaderView];
                
                // adView.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 88.f);
                //  [self.view addSubview:adView];
                
                //   [_adPicturesArray addObject:img];
                
                //                UIImageView
                //                _scrollView.contentInset =
                
                [_scrowView addSubview:imageView];
                //
                
                imageView.frame = CGRectMake(_scrowView.frame.size.width*i, 0, _scrowView.frame.size.width, _scrowView.frame.size.height);
            
                 }
            } else {
                //4
                NSString *errorString = [[error userInfo] objectForKey:@"error"];
                UIAlertView *errorAlertView = [[UIAlertView alloc] initWithTitle:@"Error" message:errorString delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
                [errorAlertView show];
            }
        }];
        
        //        //[query orderByDescending:@""];
        //        query.limit = 1;
        //        query.skip =  1;
        
        
        
    //    }
        
        
        
        
        
        
    }
            
    
    //**************
    
    //    for (int i=0; i<5; i++) {
    //        UIImageView* imageView = [[UIImageView alloc]init];
    //        NSString* imgName = [NSString stringWithFormat:@"ad_%02d", i];
    //        [imageView setImage:[UIImage imageNamed:imgName]];
    //        [_scrowView addSubview:imageView];
    //
    //       imageView.frame = CGRectMake(_scrowView.frame.size.width*i, 0, _scrowView.frame.size.width, _scrowView.frame.size.height);
    //    }
    
    UIImageView* imageView = [[UIImageView alloc]init];
    [imageView setImage:[UIImage imageNamed:@"ad_00"]];
    imageView.frame = CGRectMake(5*_scrowView.frame.size.width, 0, _scrowView.frame.size.width, _scrowView.frame.size.height);
    [_scrowView addSubview:imageView];
    
    _scrowView.contentSize = CGSizeMake(6*_scrowView.frame.size.width, _scrowView.frame.size.height);
    _scrowView.pagingEnabled = YES;
    
    _pageControl.numberOfPages = 5;
    _pageControl.pageIndicatorTintColor = [UIColor yellowColor];
    _pageControl.currentPageIndicatorTintColor = [UIColor blueColor];
    
    NSTimer * timer = [NSTimer scheduledTimerWithTimeInterval:2.f target:self selector:@selector(changPage:) userInfo:nil repeats:YES];
    _timer = timer;
    [[NSRunLoop mainRunLoop]addTimer:timer forMode:NSRunLoopCommonModes];
}

-(void)changPage:(NSTimer*)timer{
    //scrow换页操作
    NSInteger curPageNum = _pageControl.currentPage;
    
    __block NSInteger nextPageNum = curPageNum+1;
    
    [UIView animateWithDuration:1.0 animations:^{
        _scrowView.contentOffset = CGPointMake(nextPageNum*_scrowView.frame.size.width, 0);
    } completion:^(BOOL finished) {
        if (nextPageNum == 5) {
            _scrowView.contentOffset = CGPointZero;
            nextPageNum = 0;
        }
        _pageControl.currentPage = nextPageNum;
    }];
}

-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    [_timer invalidate];
    _timer = nil;
}

-(void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset{
    NSTimer * timer = [NSTimer scheduledTimerWithTimeInterval:2.f target:self selector:@selector(changPage:) userInfo:nil repeats:YES];
    _timer = timer;
    [[NSRunLoop mainRunLoop]addTimer:timer forMode:NSRunLoopCommonModes];
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    NSInteger number = (NSInteger)_scrowView.contentOffset.x/_scrowView.frame.size.width;
    _pageControl.currentPage = number;
}


@end
