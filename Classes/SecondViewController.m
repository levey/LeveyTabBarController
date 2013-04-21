    //
//  SecondViewController.m
//  LeveyTabBarDemo
//
//  Created by Levey Zhu on 12/17/10.
//  Copyright 2010 SlyFairy. All rights reserved.
//

#import "SecondViewController.h"
#import "LeveyTabBarController.h"

@implementation SecondViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIButton *pushBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [pushBtn addTarget:self action:@selector(push) forControlEvents:UIControlEventTouchUpInside];
    [pushBtn setFrame:CGRectMake(80, 150, 160, 50)];
    [pushBtn setTitle:@"Push" forState:UIControlStateNormal];
    [self.view addSubview:pushBtn];
}

- (void)push
{
	UIViewController *vc = [[UIViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
	[vc release];
}


@end
