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

// The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
/*
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization.
    }
    return self;
}
*/

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/

- (void)viewWillAppear:(BOOL)animated
{
	[super viewWillAppear:animated];

}

- (void)viewDidLoad
{
    [super viewDidLoad];
	self.view.backgroundColor = [UIColor redColor];
	
	UIBarButtonItem *rightBtn = [[UIBarButtonItem alloc] initWithTitle:@"Push" style:UIBarButtonItemStyleBordered target:self action:@selector(hide)];
	self.navigationItem.rightBarButtonItem = rightBtn;
	[rightBtn release];
	
}

- (void)hide
{
	[self.leveyTabBarController hidesTabBar:YES	animated:YES]; 
	FirstViewController *firstVC = [[FirstViewController alloc] init];
	[self.navigationController pushViewController:firstVC animated:YES];
	[firstVC release];
}
								 

/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations.
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}


@end
