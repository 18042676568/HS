//
//  HSFindModel.m
//  HomeSchool
//
//  Created by neuedu on 15/10/29.
//  Copyright (c) 2015年 neuedu. All rights reserved.
//

#import "HSFindModel.h"
#import <Parse/Parse.h>
#import "NSString+DateTransform.h"

@implementation HSFindModel
+(instancetype)hsFindModelWithDict:(PFObject *)dict{
    HSFindModel*find = [[HSFindModel alloc]init];
    if (find) {
        find.icon = ((PFFile *)dict[@"icon"]).url;
        find.name = dict[@"user"];
        find.text = dict[@"text"];
        find.pics = [NSMutableArray array];
        NSArray *arr = dict[@"images"][0];
        //NSLog(@"%@",arr);
        for (int i=0; i<arr.count; i++) {
            PFFile *p = arr[i];
            [find.pics addObject:p.url];
        }
        NSDate *date = dict.createdAt;
        NSArray *praises = dict[@"praises"];
        //NSLog(@"%@",praises);
        NSMutableString *str = [NSMutableString string];
        for (int i=0; i<praises.count; i++) {
            if (i==0) {
                [str appendString:@"     "];
            }
            [str appendFormat:@",%@",praises[i]];
        }
        //NSLog(@"%@",str);
        find.praise = str;
        //NSLog(@" s %@",dict);
        find.objectID = dict.objectId;
        find.comments = dict[@"comments"];
        find.time = [NSString YMDHMWithDate:date];
        find.commentHidden = YES;
    }
    return find;
}
@end
