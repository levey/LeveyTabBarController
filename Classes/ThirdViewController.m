//
//  ThirdViewController.m
//  LeveyTabBarDemo
//
//  Created by Levey on 7/31/12.
//
//

#import "ThirdViewController.h"
#import "LeveyTabBarController.h"
@implementation ThirdViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIButton *pushBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [pushBtn addTarget:self action:@selector(pushAndHideTabBar) forControlEvents:UIControlEventTouchUpInside];
    [pushBtn setFrame:CGRectMake(80, 150, 160, 50)];
    [pushBtn setTitle:@"Push & Hide" forState:UIControlStateNormal];
    [self.view addSubview:pushBtn];
}

- (void)pushAndHideTabBar
{
	UIViewController *vc = [[UIViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
	[vc release];
    
    [self.leveyTabBarController hidesTabBar:YES animated:YES];
}


@end
