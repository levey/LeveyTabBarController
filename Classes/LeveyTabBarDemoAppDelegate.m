//
//  LeveyTabBarDemoAppDelegate.m
//  LeveyTabBarDemo
//
//  Created by Levey Zhu on 12/17/10.
//  Copyright 2010 VanillaTech. All rights reserved.
//

#import "LeveyTabBarDemoAppDelegate.h"
#import "FirstViewController.h"
#import "SecondViewController.h"
#import "LeveyTabBarController.h"

@implementation LeveyTabBarDemoAppDelegate

@synthesize window;
@synthesize leveyTabBarController;


#pragma mark -
#pragma mark Application lifecycle

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions 
{    
    
    FirstViewController *firstVC = [[FirstViewController alloc] init];
	SecondViewController *secondVC = [[SecondViewController alloc] init];
	UITableViewController *thirdVC = [[UITableViewController alloc] init];
	UIViewController *fourthVC = [[UIViewController alloc] init];
	fourthVC.view.backgroundColor = [UIColor grayColor];
	FirstViewController *fifthVC = [[FirstViewController alloc] init];
	UINavigationController *nc = [[UINavigationController alloc] initWithRootViewController:secondVC];
	nc.delegate = self;
	[secondVC release];
	NSArray *arr = [NSArray arrayWithObjects:firstVC,nc,thirdVC,fourthVC,fifthVC,nil];
	[firstVC release];
	[nc release];
	[thirdVC release];
	[fourthVC release];
	[fifthVC release];
		
	NSMutableDictionary *imgDic = [NSMutableDictionary dictionaryWithCapacity:3];
	[imgDic setObject:[UIImage imageNamed:@"1.png"] forKey:@"Default"];
	[imgDic setObject:[UIImage imageNamed:@"2.png"] forKey:@"Highlighted"];
	[imgDic setObject:[UIImage imageNamed:@"2.png"] forKey:@"Seleted"];
	NSMutableDictionary *imgDic2 = [NSMutableDictionary dictionaryWithCapacity:3];
	[imgDic2 setObject:[UIImage imageNamed:@"1.png"] forKey:@"Default"];
	[imgDic2 setObject:[UIImage imageNamed:@"2.png"] forKey:@"Highlighted"];
	[imgDic2 setObject:[UIImage imageNamed:@"2.png"] forKey:@"Seleted"];
	NSMutableDictionary *imgDic3 = [NSMutableDictionary dictionaryWithCapacity:3];
	[imgDic3 setObject:[UIImage imageNamed:@"1.png"] forKey:@"Default"];
	[imgDic3 setObject:[UIImage imageNamed:@"2.png"] forKey:@"Highlighted"];
	[imgDic3 setObject:[UIImage imageNamed:@"2.png"] forKey:@"Seleted"];
	NSMutableDictionary *imgDic4 = [NSMutableDictionary dictionaryWithCapacity:3];
	[imgDic4 setObject:[UIImage imageNamed:@"1.png"] forKey:@"Default"];
	[imgDic4 setObject:[UIImage imageNamed:@"2.png"] forKey:@"Highlighted"];
	[imgDic4 setObject:[UIImage imageNamed:@"2.png"] forKey:@"Seleted"];
	NSMutableDictionary *imgDic5 = [NSMutableDictionary dictionaryWithCapacity:3];
	[imgDic5 setObject:[UIImage imageNamed:@"1.png"] forKey:@"Default"];
	[imgDic5 setObject:[UIImage imageNamed:@"2.png"] forKey:@"Highlighted"];
	[imgDic5 setObject:[UIImage imageNamed:@"2.png"] forKey:@"Seleted"];
	
	NSArray *imgArr = [NSArray arrayWithObjects:imgDic,imgDic2,imgDic3,imgDic4,imgDic5,nil];
	
	leveyTabBarController = [[LeveyTabBarController alloc] initWithViewControllers:arr imageArray:imgArr];
	NSLog(@"%@",leveyTabBarController.tabBar);
	[leveyTabBarController.tabBar setBackgroundImage:[UIImage imageNamed:@"tabbarbg.png"]];
	[leveyTabBarController setTabBarTransparent:YES];
	[self.window addSubview:leveyTabBarController.view];
    [self.window makeKeyAndVisible];

    return YES;
}
- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{
	if ([viewController isKindOfClass:[SecondViewController class]])
	{
			[leveyTabBarController hidesTabBar:NO	animated:YES]; 
	}
}


- (void)applicationWillResignActive:(UIApplication *)application {
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, called instead of applicationWillTerminate: when the user quits.
     */
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    /*
     Called as part of  transition from the background to the inactive state: here you can undo many of the changes made on entering the background.
     */
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}


- (void)applicationWillTerminate:(UIApplication *)application {
    /*
     Called when the application is about to terminate.
     See also applicationDidEnterBackground:.
     */
}


#pragma mark -
#pragma mark Memory management

- (void)applicationDidReceiveMemoryWarning:(UIApplication *)application {
    /*
     Free up as much memory as possible by purging cached data objects that can be recreated (or reloaded from disk) later.
     */
}


- (void)dealloc {
    [leveyTabBarController release];
    [window release];
    [super dealloc];
}


@end
