//
//  AppDelegate.m
//  NavigationBarColor
//
//  Created by Борис on 09.11.16.
//  Copyright © 2016 Анели Борис. All rights reserved.
//

#import "AppDelegate.h"
#import "BADefaultViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    BADefaultViewController *defaultViewController = [[BADefaultViewController alloc] init];
    
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:defaultViewController];
    
    [self.window setRootViewController:navigationController];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    return YES;
}

@end
