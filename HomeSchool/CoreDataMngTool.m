//
//  CoreDataMngTool.m
//  iOSCoreDataDemo
//
//  Created by hegf on 15/9/10.
//  Copyright (c) 2015年 hegf. All rights reserved.
//

#import "CoreDataMngTool.h"
#import <CoreData/CoreData.h>
#import "AppDelegate.h"

@implementation CoreDataMngTool

+(NSArray *)serachLessons{
    
    AppDelegate* delegate = [UIApplication sharedApplication].delegate;
    
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    
    NSEntityDescription *desc = [NSEntityDescription entityForName:@"Lesson" inManagedObjectContext:delegate.managedObjectContext];
    request.entity = desc;
    
    NSSortDescriptor *sort = [NSSortDescriptor sortDescriptorWithKey:@"time" ascending:YES];
    request.sortDescriptors = [NSArray arrayWithObject:sort];

    
    NSError *error = nil;
    NSArray *objs = [delegate.managedObjectContext executeFetchRequest:request error:&error];
    if (error) {
        [NSException raise:@"查询错误" format:@"%@", [error localizedDescription]];
    }
    
    return objs;

}

@end
