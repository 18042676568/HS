//
//  Lesson.h
//  HomeSchool
//
//  Created by neuedu on 15/10/18.
//  Copyright (c) 2015年 neuedu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Lesson : NSManagedObject

@property (nonatomic, retain) NSString * lesson;
@property (nonatomic, retain) NSString * teacher;
@property (nonatomic, retain) NSString * time;
@property (nonatomic, retain) NSString * address;
+(instancetype)lessonWithDict:(NSDictionary*)dict;

@end
