### How to Use

* * *

**Initialization**

	leveyTabBarController = [[LeveyTabBarController alloc] initWithViewControllers:YOUR_CONTROLLERS imageArray:YOUR_IMAGES];
	
**Custom Background Image**

	[leveyTabBarController.tabBar setBackgroundImage:[UIImage imageNamed:@"tabbarbg.png"]];
	
**Make TabBar Transparent**

	[leveyTabBarController setTabBarTransparent:YES];
	
**Add a Tab**
	
	UIViewController *vc = [[FirstViewController alloc] init];
    [self.leveyTabBarController insertViewController:vc withImageDic:YOUR_IMAGES atIndex:YOUR_INDEX];
	[vc release];



###Screenshots⤵


![0](http://ww1.sinaimg.cn/mw690/72c6cd8bgw1dvfvrm5o0fj.jpg)


![1](http://ww3.sinaimg.cn/large/72c6cd8bgw1dvfvq1xktjj.jpg)

* * *

**And always, have a nice day!**


