//
//  SEAppDelegate.m
//  homework-5
//
//  Created by Wadim on 7/28/14.
//  Copyright (c) 2014 Smirnov Electronics. All rights reserved.
//

#import "SEAppDelegate.h"
#import "SEAboutVC.h"
#import "SENavigationSourceVC.h"
#import "UIColor+ColorFromHexString.h"

@interface SEAppDelegate ()

@property (nonatomic, strong) UITabBarController *rootTabBarController;
@property (nonatomic, strong) UINavigationController *firstTabNC;
@property (nonatomic, strong) UINavigationController *secondTabNC;
@property (nonatomic, strong) SEAboutVC *thirdTabVC;

@end

@implementation SEAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.rootTabBarController = [[UITabBarController alloc]init];
    [self.window setRootViewController:_rootTabBarController];
    
    [self.rootTabBarController.view setBackgroundColor:
        [UIColor rhythmusBackgroundColor]];
    [self.rootTabBarController.tabBar setBarTintColor:
        [UIColor rhythmusTapBarColor]];
    
    SENavigationSourceVC *firstSource = [[SENavigationSourceVC alloc]init];
    self.firstTabNC = [[UINavigationController alloc]initWithRootViewController:firstSource];
    self.firstTabNC.tabBarItem.imageInsets = (UIEdgeInsets) {
        5, 0, -5, 0
    };
            
    SENavigationSourceVC *secondSource = [[SENavigationSourceVC alloc]init];
    self.secondTabNC = [[UINavigationController alloc]initWithRootViewController:secondSource];
    self.secondTabNC.tabBarItem.imageInsets = (UIEdgeInsets) {
        5, 0, -5, 0
    };
    self.thirdTabVC = [[SEAboutVC alloc]init];
    self.thirdTabVC.tabBarItem.image = [UIImage imageNamed:@"pencil"];
    self.thirdTabVC.view.backgroundColor = [UIColor rhythmusBackgroundColor];
    self.thirdTabVC.tabBarItem.imageInsets = (UIEdgeInsets) {
        5, 0, -5, 0
    };

    [self.firstTabNC.navigationBar setBarTintColor:[UIColor rhythmusNavBarColor]];
    self.firstTabNC.tabBarItem.image = [UIImage imageNamed:@"fileCabinet"];
    self.firstTabNC.tabBarItem.title = @"";
    
    [self.secondTabNC.navigationBar setBarTintColor:[UIColor rhythmusNavBarColor]];
    self.secondTabNC.tabBarItem.image = [UIImage imageNamed:@"padViewTabIcon"];
    self.secondTabNC.tabBarItem.title = @"";
    
    [self.rootTabBarController setViewControllers:@[_firstTabNC, _secondTabNC, _thirdTabVC]];
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Saves changes in the application's managed object context before the application terminates.
    [self saveContext];
}

- (void)saveContext
{
    NSError *error = nil;
    NSManagedObjectContext *managedObjectContext = self.managedObjectContext;
    if (managedObjectContext != nil) {
        if ([managedObjectContext hasChanges] && ![managedObjectContext save:&error]) {
             // Replace this implementation with code to handle the error appropriately.
             // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development. 
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        } 
    }
}

#pragma mark - Application's Documents directory

// Returns the URL to the application's Documents directory.
- (NSURL *)applicationDocumentsDirectory
{
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

@end
