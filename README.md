# DHPageViewControllerDataSource

`DHPageViewControllerDataSource` is an Objective-C class for iOS apps that implements `UIPageViewControllerDataSource` for static content, represented as an array of view controllers. It makes the simple case of a static list of content view controllers really easy to set up in code.

## Status

Last tested with Xcode 6.0 and the iOS 8.0 SDK.

## Usage

Create a `DHPageViewControllerDataSource` passing an array of view controllers whose views will be shown as pages. Send the data source `becomeDataSourceOfPageViewController:`, passing the `UIPageViewController` as the argument.

	DHPageViewControllerDataSource *pageDataSource = [[DHPageViewControllerDataSource alloc] initWithViewControllers:@[<#view controllers#>]];
	[pageDataSource becomeDataSourceOfPageViewController:<#page view controller#>];

Keep a strong reference to the data source.

An example project is included, in which the application delegate keeps a strong reference to its `pageDataSource` using a read-only, lazily-loaded property.

## Screen shot

There isn’t much to look at, but the example project looks like this:

<img src="http://douglashill.co/files/DHPageViewControllerDataSource-640x960.png" width="320" height="480">

## Licence

MIT license — see License.txt
