// Douglas Hill, August 2014
// https://github.com/douglashill/DHPageViewControllerDataSource

#import "AppDelegate.h"

#import "ContentViewController.h"
#import "DHPageViewControllerDataSource.h"

@interface AppDelegate ()

@property (nonatomic, strong, readonly) DHPageViewControllerDataSource *pageDataSource;

@end

@implementation AppDelegate
{
	DHPageViewControllerDataSource *_pageDataSource;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
	UIPageViewController *const pageViewController = [[UIPageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStylePageCurl navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];
	
	[[self pageDataSource] becomeDataSourceOfPageViewController:pageViewController];
	
	[self setWindow:[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]]];
	[[self window] setRootViewController:pageViewController];
	[[self window] makeKeyAndVisible];
	
	return YES;
}

- (DHPageViewControllerDataSource *)pageDataSource
{
	if (_pageDataSource) return _pageDataSource;
	
	NSMutableArray *viewControllers = [NSMutableArray array];
	for (int idx = 1; idx <= 5; ++idx) {
		[viewControllers addObject:[[ContentViewController alloc] initWithTitle:[NSString stringWithFormat:@"View Controller %d", idx]]];
	}
	
	_pageDataSource = [[DHPageViewControllerDataSource alloc] initWithViewControllers:viewControllers];
	
	return _pageDataSource;
}

@end
