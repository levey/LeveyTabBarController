//
//  LeveyTabBarControllerViewController.m
//  LeveyTabBarController
//
//  Created by Levey Zhu on 12/15/10.
//  Copyright 2010 VanillaTech. All rights reserved.
//

#import "LeveyTabBarController.h"
#import "LeveyTabBar.h"
#define kTabBarHeight 49.0f

static LeveyTabBarController *leveyTabBarController;

@implementation UIViewController (LeveyTabBarControllerSupport)

- (LeveyTabBarController *)leveyTabBarController
{
	return leveyTabBarController;
}

@end


@implementation LeveyTabBarController
//@synthesize tabBar = _tabBar;
@synthesize delegate = _delegate;
@synthesize selectedViewController = _selectedViewController;
@synthesize viewControllers = _viewControllers;
@synthesize imageArray = _imageArray;
@synthesize tabBarHidden = _tabBarHidden;

#pragma mark -
#pragma mark lifecycle
- (id)initWithViewControllers:(NSArray *)vcs imageArray:(NSArray *)arr;
{
	self = [super init];
	if (self != nil)
	{
		self.viewControllers = vcs;
		self.imageArray = arr;
		
		_containerView = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] applicationFrame]];
		
		_transitionView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320.0f, _containerView.frame.size.height - kTabBarHeight)];
		_transitionView.backgroundColor =  [UIColor groupTableViewBackgroundColor];
		
		_tabBar = [[LeveyTabBar alloc] initWithFrame:CGRectMake(0, _containerView.frame.size.height - kTabBarHeight, 320.0f, kTabBarHeight) buttonImages:self.imageArray];
		_tabBar.delegate = self;
		
		for (UIViewController *vc in vcs)
		{
			leveyTabBarController = self;
			//vc.tabBarController = self;
			
			//TODO: HERE!
		}
	}
	return self;
}

- (void)loadView 
{
	[super loadView];
	
	[_containerView addSubview:_transitionView];
	[_transitionView release];
	
	[_containerView addSubview:_tabBar];
	[_tabBar release];
	//for (UIViewController *vc in self.viewControllers) 
//	{
//		vc.view.frame = _transitionView.bounds;
//	}
	
	self.view = _containerView;
	//[firstView release];
	
}
- (void)viewDidLoad 
{
    [super viewDidLoad];
	self.selectedIndex = 0;
}
- (void)viewDidUnload
{
	[super viewDidUnload];
	
	_tabBar = nil;
	_delegate = nil;
	_selectedViewController = nil;
	_viewControllers = nil;
}


- (void)dealloc 
{
	[_tabBar release];
	[_delegate release];
	[_selectedViewController release];
	[_viewControllers release];
    [super dealloc];
}
#pragma mark -
#pragma mark methods
- (LeveyTabBar *)tabBar
{
	return _tabBar;
}
- (BOOL)tabBarTransparent
{
	return _tabBarTransparent;
}
- (void)setTabBarTransparent:(BOOL)yesOrNo
{
	if (yesOrNo == YES)
	{
		_transitionView.frame = _containerView.bounds;
	}
	else
	{
		_transitionView.frame = CGRectMake(0, 0, 320.0f, _containerView.frame.size.height - kTabBarHeight);
	}

}
- (void)hidesTabBar:(BOOL)yesOrNO animated:(BOOL)animated;
{
	if (yesOrNO == YES)
	{
		if (self.tabBar.frame.origin.y == self.view.frame.size.height)
		{
			return;
		}
	}
	else 
	{
		if (self.tabBar.frame.origin.y == self.view.frame.size.height - kTabBarHeight)
		{
			return;
		}
	}
	
	if (animated == YES)
	{
		[UIView beginAnimations:nil context:NULL];
		[UIView setAnimationDuration:0.3f];
		if (yesOrNO == YES)
		{
			self.tabBar.frame = CGRectMake(self.tabBar.frame.origin.x, self.tabBar.frame.origin.y + kTabBarHeight, self.tabBar.frame.size.width, self.tabBar.frame.size.height);
		}
		else 
		{
			self.tabBar.frame = CGRectMake(self.tabBar.frame.origin.x, self.tabBar.frame.origin.y - kTabBarHeight, self.tabBar.frame.size.width, self.tabBar.frame.size.height);
		}
		[UIView commitAnimations];
	}
	else 
	{
		if (yesOrNO == YES)
		{
			self.tabBar.frame = CGRectMake(self.tabBar.frame.origin.x, self.tabBar.frame.origin.y + kTabBarHeight, self.tabBar.frame.size.width, self.tabBar.frame.size.height);
		}
		else 
		{
			self.tabBar.frame = CGRectMake(self.tabBar.frame.origin.x, self.tabBar.frame.origin.y - kTabBarHeight, self.tabBar.frame.size.width, self.tabBar.frame.size.height);
		}
	}
}

- (NSUInteger)selectedIndex
{
	return [self.viewControllers indexOfObject:self.selectedViewController];
}

-(void)setSelectedIndex:(NSUInteger)index
{
	self.selectedViewController = nil;
	self.selectedViewController = [self.viewControllers objectAtIndex:index];
	NSLog(@"%@",[self.selectedViewController class]);
	
	self.selectedViewController.view.frame = _transitionView.frame;
	if ([self.selectedViewController.view isDescendantOfView:_transitionView]) 
	{
		[_transitionView bringSubviewToFront:self.selectedViewController.view];
	}
	else
	{
		[_transitionView addSubview:self.selectedViewController.view];
	}
	[_tabBar selectTabInIndex:index];
	
}
#pragma mark -
#pragma mark tabBar delegates
- (void)tabBar:(LeveyTabBar *)tabBar didSelectIndex:(NSInteger)index
{
	[self setSelectedIndex:index];
	NSLog(@"change to index:%d",index);
}
@end
