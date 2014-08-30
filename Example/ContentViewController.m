// Douglas Hill, August 2014
// https://github.com/douglashill/DHPageViewControllerDataSource

#import "ContentViewController.h"

@implementation ContentViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
	return [self initWithTitle:nil];
}

- (instancetype)initWithTitle:(NSString *)title
{
	self = [super initWithNibName:nil bundle:nil];
	if (self == nil) return nil;
	
	[self setTitle:title];
	
	return self;
}

- (void)loadView
{
	[self setView:[[UIView alloc] init]];
	
	static NSUInteger const hueLevels = 100;
	CGFloat hue = ([[self title] hash] % (hueLevels + 1)) / (CGFloat)hueLevels;
	[[self view] setBackgroundColor:[UIColor colorWithHue:hue saturation:1 brightness:1 alpha:1]];
	
	UILabel *const label = [[UILabel alloc] init];
	[label setText:[self title]];
	[label setTranslatesAutoresizingMaskIntoConstraints:NO];
	[[self view] addSubview:label];
	
	[[self view] addConstraint:[NSLayoutConstraint constraintWithItem:label attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:[self view] attribute:NSLayoutAttributeCenterX multiplier:1 constant:0]];
	[[self view] addConstraint:[NSLayoutConstraint constraintWithItem:label attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:[self view] attribute:NSLayoutAttributeCenterY multiplier:1 constant:0]];
}

@end
