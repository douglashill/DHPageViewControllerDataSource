// Douglas Hill, August 2014
// https://github.com/douglashill/DHPageViewControllerDataSource

@import UIKit;

@interface DHPageViewControllerDataSource : NSObject <UIPageViewControllerDataSource>

/// Designated initialiser. `viewControllers` is the array of content view controllers to show in the page view controller.
- (instancetype)initWithViewControllers:(NSArray *)viewControllers __attribute((objc_designated_initializer));

/// Sets the receiver as the data source `pageViewController` and sets `pageViewController`’s initial view controller to the first content view controller.
- (void)becomeDataSourceOfPageViewController:(UIPageViewController *)pageViewController;

@end
