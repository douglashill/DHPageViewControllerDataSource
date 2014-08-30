// Douglas Hill, August 2014
// https://github.com/douglashill/DHPageViewControllerDataSource

#import "DHPageViewControllerDataSource.h"

@interface DHPageViewControllerDataSource ()

@property (nonatomic, copy, readonly) NSArray *viewControllers;

@end

@implementation DHPageViewControllerDataSource

- (id)init
{
	return [self initWithViewControllers:nil];
}

- (instancetype)initWithViewControllers:(NSArray *)viewControllers
{
	self = [super init];
	if (self == nil) return nil;
	
	_viewControllers = [viewControllers copy];
	
	return self;
}

- (void)becomeDataSourceOfPageViewController:(UIPageViewController *)pageViewController
{
	[pageViewController setDataSource:self];
	
	[pageViewController setViewControllers:@[[[self viewControllers] firstObject]] direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
}

#pragma mark - UIPageViewControllerDataSource

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController
{
	return [self viewControllerWithOffset:-1 relativeToViewController:viewController];
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController
{
	return [self viewControllerWithOffset:+1 relativeToViewController:viewController];
}

- (NSInteger)presentationIndexForPageViewController:(UIPageViewController *)pageViewController
{
	return [[self viewControllers] indexOfObject:[[pageViewController viewControllers] firstObject]];
}

- (NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewController
{
	return [[self viewControllers] count];
}

#pragma mark -

- (UIViewController *)viewControllerWithOffset:(NSInteger)offset relativeToViewController:(UIViewController *)viewController
{
	NSInteger const toIndex = (NSInteger)[[self viewControllers] indexOfObject:viewController] + offset;
	
	if (toIndex < 0 || toIndex >= [[self viewControllers] count]) {
		return nil;
	}
	
	return [self viewControllers][toIndex];
}

@end
