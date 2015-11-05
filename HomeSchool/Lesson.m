//
//  Lesson.m
//  HomeSchool
//
//  Created by neuedu on 15/10/18.
//  Copyright (c) 2015年 neuedu. All rights reserved.
//

#import "Lesson.h"
#import "AppDelegate.h"

@implementation Lesson

@dynamic lesson;
@dynamic teacher;
@dynamic time;
@dynamic address;
+(instancetype)lessonWithDict:(NSDictionary *)dict{
    AppDelegate* delegate = [UIApplication sharedApplication].delegate;
    
    Lesson *lesson = [NSEntityDescription insertNewObjectForEntityForName:@"Lesson" inManagedObjectContext:delegate.managedObjectContext];

    if (lesson) {
        lesson.teacher = [dict objectForKey:@"teacher"];
        lesson.time = [dict objectForKey:@"time"];
        lesson.lesson = [dict objectForKey:@"lesson"];
        lesson.address = [dict objectForKey:@"address"];
    }
    [delegate saveContext];
    return lesson;
}

@end
