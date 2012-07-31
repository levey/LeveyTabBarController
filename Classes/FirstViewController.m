    //
//  FirstViewController.m
//  LeveyTabBarDemo
//
//  Created by Levey Zhu on 12/17/10.
//  Copyright 2010 VanillaTech. All rights reserved.
//

#import "FirstViewController.h"
#import "LeveyTabBarController.h"


@implementation FirstViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIButton *addBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [addBtn addTarget:self action:@selector(addTab) forControlEvents:UIControlEventTouchUpInside];
    [addBtn setFrame:CGRectMake(80, 150, 160, 50)];
    [addBtn setTitle:@"Add a Tab" forState:UIControlStateNormal];
    [self.view addSubview:addBtn];
}

- (void)addTab
{
    NSMutableDictionary *imgDic5 = [NSMutableDictionary dictionaryWithCapacity:3];
	[imgDic5 setObject:[UIImage imageNamed:@"1.png"] forKey:@"Default"];
	[imgDic5 setObject:[UIImage imageNamed:@"2.png"] forKey:@"Highlighted"];
	[imgDic5 setObject:[UIImage imageNamed:@"2.png"] forKey:@"Seleted"];
    
    int lastIndex = [[self.leveyTabBarController viewControllers] count] - 1;
    lastIndex = lastIndex > 0 ? lastIndex : 0;
    
	UIViewController *vc = [[FirstViewController alloc] init];
    [self.leveyTabBarController insertViewController:vc withImageDic:imgDic5 atIndex:lastIndex];
	[vc release];
}


@end
