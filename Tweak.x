/* How to Hook with Logos
Hooks are written with syntax similar to that of an Objective-C @implementation.
You don't need to #include <substrate.h>, it will be done automatically, as will
the generation of a class list and an automatic constructor.
*/

%hook RootViewController

- (void)viewWillLayoutSubviews {
	%orig;

	UIView *view = [self valueForKey:@"view"];
	UIView *tabToolBar = [[view subviews] lastObject];
	tabToolBar.frame = CGRectMake(0, 0, tabToolBar.frame.size.width, tabToolBar.frame.size.height - 15);
}

- (void)addTerminal {
	%orig;

	UIView *view = [self valueForKey:@"view"];
	UIView *tabToolBar = [[view subviews] lastObject];
	tabToolBar.frame = CGRectMake(0, 0, tabToolBar.frame.size.width, tabToolBar.frame.size.height - 15);
}

%end

%hook TabCollectionViewCell

- (id)initWithFrame:(CGRect)frame {
	id result = %orig;

	UIView *selectedBackgroundView = [self valueForKey:@"selectedBackgroundView"];
	selectedBackgroundView.layer.cornerRadius = selectedBackgroundView.frame.size.height / 2.0;
    selectedBackgroundView.layer.masksToBounds = YES;

	return result;
}

%end

%ctor {
    %init(RootViewController = objc_getClass("NewTerm.RootViewController"), TabCollectionViewCell = objc_getClass("NewTerm.TabCollectionViewCell"));
}


