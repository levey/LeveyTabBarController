//
//  LeveyTabBarDemoAppDelegate.h
//  LeveyTabBarDemo
//
//  Created by Levey Zhu on 12/17/10.
//  Copyright 2010 VanillaTech. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LeveyTabBarController;

@interface LeveyTabBarDemoAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    LeveyTabBarController *leveyTabBarController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet LeveyTabBarController *leveyTabBarController;

@end

