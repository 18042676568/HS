//
//  AppDelegate.m
//  HomeSchool
//
//  Created by neuedu on 15/9/16.
//  Copyright (c) 2015年 neuedu. All rights reserved.
//

#import "AppDelegate.h"
#import "HSMainPageViewController.h"
#import <Parse/Parse.h>
//#import "HSLogonViewController.h"
#import "HSWelcomePageViewController.h"


@interface AppDelegate ()



@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    
   [Parse setApplicationId:@"jlaKscSOU7TLkiAChVmIy1e5wMCLDwO52oC15rVU"
                 clientKey:@"cOmaeoJmm5wtmTJxKj2qJmKYIzYcw0ekrY6jmZlQ"];
//  
//    
//////    建立用户，异步上传数据
////    
//    
//    
//    
//    PFObject *anotherPlayer = [PFObject objectWithClassName:@"Player"];
//    [anotherPlayer setObject:@"Jack"forKey:@"Name"];
//    [anotherPlayer setObject:[NSNumber numberWithInt:840] forKey:@"Score"];
//    [anotherPlayer saveInBackgroundWithBlock:^(BOOL succeeded,NSError *error){
//        if(succeeded){
//            NSLog(@"Object Uploaded");
//        } else{
//            
//            NSString *errorString = [[error userInfo]objectForKey:@"error"];
//            
//            NSLog(@"Error:%@",errorString);
//        } }];
//    
//    
//    
//    
//    PFQuery *query = [PFQuery queryWithClassName:@"Player"]; //1
//    [query whereKey:@"Name"equalTo:@"John"]; //2
//    [query whereKey:@"Score"greaterThan:[NSNumber numberWithInt:1000]]; //3
//    [query findObjectsInBackgroundWithBlock:^(NSArray * objects, NSError *error)
//    {
//        //4
//        
//    if(!error){
//        
//        NSLog(@"Successfully retrieved: %@",objects);
//    }else
//    {
//        NSString *errorString = [[error userInfo]objectForKey:@"error"];
//        NSLog(@"Error:%@",errorString);
//    }
//    }];
//    
//    
//    
//    
//    
////    按照注释编号来依次来解释下
////    1. 创建了一个查询对象,名字是表的名称。
////    2. 限定Name的值为John
////    3. 限制Score的值为大于1000
////    4. 发送查询,并在block块语句中打印查询结果。
////    
////
//    
//    
//    
//    
////    登陆，判断！！@@@
//    
//    
//    [PFUser logInWithUsernameInBackground:@"123" password:@"123456"
//                                    block:^(PFUser *user, NSError *error) {
//                                        if (user) {
//                                            // Do stuff after successful login.
//                                            
//                                            NSLog(@"sucessful");
//                                            
//                                            
//                                            
//                                            
//                                        } else {
//                                            // The login failed. Check error to see why.
//                                            
//                                            NSLog(@"failed");
//
//                                            
//                                            
//                                            
//                                        }
//                                    }];
//    
    
//    重置密码
    
//    [PFUser requestPasswordResetForEmailInBackground:@"email@example.com"];
    
    
    //1.取得本app的版本号
    NSDictionary* infoDict = [NSBundle mainBundle].infoDictionary;
    NSString* newVersion = infoDict[@"CFBundleVersion"];
    NSLog(@"newVersion %@", newVersion);
    
    //2.和之前保存的app版本号 对比 如果相同，则从主页启动，如果不同从欢迎页
    NSString* oldVersion = [[NSUserDefaults standardUserDefaults] objectForKey:@"CFBundleVersion"];
    if (oldVersion == nil) {
        //从欢迎页启动
        UIStoryboard* storyBoard = [UIStoryboard storyboardWithName:@"HSWelcomePage" bundle:nil];
        HSWelcomePageViewController* welVC = [storyBoard instantiateViewControllerWithIdentifier:@"welPage"];
        UIWindow *window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
        self.window = window;
        window.rootViewController = welVC;
        [window makeKeyAndVisible];
    }else{
        if ([oldVersion isEqualToString:newVersion]) {
            //从主页启动
            UIWindow *window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
            self.window = window;
            //                HSMainPageViewController *mainPage = [[HSMainPageViewController alloc]init];
            //            window.rootViewController = mainPage;
            //HSLogonViewController *logon = [[HSLogonViewController alloc]init];
            UIStoryboard* storyboard0 = [UIStoryboard storyboardWithName:@"HSLogon" bundle:nil];
            UINavigationController *logon = [storyboard0 instantiateViewControllerWithIdentifier:@"logon"];
            window.rootViewController = logon;
            [window makeKeyAndVisible];
            
        }else{
            //从欢迎页启动
            UIStoryboard* storyBoard = [UIStoryboard storyboardWithName:@"HSWelcomePage" bundle:nil];
            HSWelcomePageViewController* welVC = [storyBoard instantiateViewControllerWithIdentifier:@"welPage"];
            UIWindow *window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
            self.window = window;
            window.rootViewController = welVC;
            [window makeKeyAndVisible];
        }
    }
    
    //3.如果不同 把新的app版本号 保存起来
    [[NSUserDefaults standardUserDefaults] setObject:newVersion forKey:@"CFBundleVersion"];
    //NSLog(@"doc Path%@", [self applicationDocumentsDirectory]);
    
    //    UIWindow *window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    //    self.window = window;
    //    HSMainPageViewController *mainPage = [[HSMainPageViewController alloc]init];
    //    window.rootViewController = mainPage;
    //    [window makeKeyAndVisible];

    
    
    
    
    
//    //    用户认证
//    //1
//    PFUser *user = [PFUser user];
//    //2
//    user.username = @"hegf";
//    user.password = @"123456";
//    
//    //3
//    [user signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
//        if (!error) {
//            //The registration was successful, go to the wall
//            // [self performSegueWithIdentifier:@"SignupSuccesful" sender:self];
//            NSLog(@"signUp sucess");
//            
//        } else {
//            //Something bad has occurred
//            NSString *errorString = [[error userInfo] objectForKey:@"error"];
//            
//            
//            UIAlertView *errorAlertView = [[UIAlertView alloc] initWithTitle:@"Error" message:errorString delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
//            [errorAlertView show];
//        }
//    }];
//    
//    
//    
//    [PFUser logInWithUsernameInBackground:@"hegf" password:@"123456" block:^(PFUser *user, NSError *error) {
//        if (user) {
//            //Open the wall
//            NSLog(@"login sucess");
//            //[self performSegueWithIdentifier:@"LoginSuccesful" sender:self];
//        } else {
//            //Something bad has ocurred
//            NSString *errorString = [[error userInfo] objectForKey:@"error"];
//            UIAlertView *errorAlertView = [[UIAlertView alloc] initWithTitle:@"Error" message:errorString delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
//            [errorAlertView show];
//        }
//    }];
//    
//    //[PFUser enableRevocableSessionInBackground];
//    
//
//    
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    // Saves changes in the application's managed object context before the application terminates.
    [self saveContext];
}

#pragma mark - Core Data stack

@synthesize managedObjectContext = _managedObjectContext;
@synthesize managedObjectModel = _managedObjectModel;
@synthesize persistentStoreCoordinator = _persistentStoreCoordinator;

- (NSURL *)applicationDocumentsDirectory {
    // The directory the application uses to store the Core Data store file. This code uses a directory named "tttt.HomeSchool" in the application's documents directory.
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

- (NSManagedObjectModel *)managedObjectModel {
    // The managed object model for the application. It is a fatal error for the application not to be able to find and load its model.
    if (_managedObjectModel != nil) {
        return _managedObjectModel;
    }
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"HomeSchool" withExtension:@"momd"];
    _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    return _managedObjectModel;
}

- (NSPersistentStoreCoordinator *)persistentStoreCoordinator {
    // The persistent store coordinator for the application. This implementation creates and return a coordinator, having added the store for the application to it.
    if (_persistentStoreCoordinator != nil) {
        return _persistentStoreCoordinator;
    }
    
    // Create the coordinator and store
    
    _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"HomeSchool.sqlite"];
    NSError *error = nil;
    NSString *failureReason = @"There was an error creating or loading the application's saved data.";
    if (![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error]) {
        // Report any error we got.
        NSMutableDictionary *dict = [NSMutableDictionary dictionary];
        dict[NSLocalizedDescriptionKey] = @"Failed to initialize the application's saved data";
        dict[NSLocalizedFailureReasonErrorKey] = failureReason;
        dict[NSUnderlyingErrorKey] = error;
        error = [NSError errorWithDomain:@"YOUR_ERROR_DOMAIN" code:9999 userInfo:dict];
        // Replace this with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
    
    return _persistentStoreCoordinator;
}


- (NSManagedObjectContext *)managedObjectContext {
    // Returns the managed object context for the application (which is already bound to the persistent store coordinator for the application.)
    if (_managedObjectContext != nil) {
        return _managedObjectContext;
    }
    
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (!coordinator) {
        return nil;
    }
    _managedObjectContext = [[NSManagedObjectContext alloc] init];
    [_managedObjectContext setPersistentStoreCoordinator:coordinator];
    return _managedObjectContext;
}

#pragma mark - Core Data Saving support

- (void)saveContext {
    NSManagedObjectContext *managedObjectContext = self.managedObjectContext;
    if (managedObjectContext != nil) {
        NSError *error = nil;
        if ([managedObjectContext hasChanges] && ![managedObjectContext save:&error]) {
       
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        }
    }
}

@end
