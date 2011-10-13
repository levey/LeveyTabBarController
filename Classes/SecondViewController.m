    //
//  SecondViewController.m
//  LeveyTabBarDemo
//
//  Created by Levey Zhu on 12/17/10.
//  Copyright 2010 VanillaTech. All rights reserved.
//

#import "SecondViewController.h"
#import "LeveyTabBarController.h"
#import "FirstViewController.h"

@implementation SecondViewController


- (void)viewWillAppear:(BOOL)animated
{
	[super viewWillAppear:animated];

}

- (void)viewDidLoad
{
    [super viewDidLoad];
	self.view.backgroundColor = [UIColor redColor];
	
	UIBarButtonItem *rightBtn = [[UIBarButtonItem alloc] initWithTitle:@"Add" style:UIBarButtonItemStyleBordered target:self action:@selector(hide)];
	self.navigationItem.rightBarButtonItem = rightBtn;
	[rightBtn release];
	
}

- (void)hide
{
//	[self.leveyTabBarController hidesTabBar:YES	animated:YES]; 
//    [self.leveyTabBarController removeViewControllerAtIndex:3]; 
    NSMutableDictionary *imgDic5 = [NSMutableDictionary dictionaryWithCapacity:3];
	[imgDic5 setObject:[UIImage imageNamed:@"1.png"] forKey:@"Default"];
	[imgDic5 setObject:[UIImage imageNamed:@"2.png"] forKey:@"Highlighted"];
	[imgDic5 setObject:[UIImage imageNamed:@"2.png"] forKey:@"Seleted"];
    
	FirstViewController *firstVC = [[FirstViewController alloc] init];
//	[self.navigationController pushViewController:firstVC animated:YES];
    [self.leveyTabBarController insertViewController:firstVC withImageDic:imgDic5 atIndex:2];
	[firstVC release];
}
								 


- (void)dealloc {
    [super dealloc];
}


@end
