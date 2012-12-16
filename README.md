# RAExpendable

NSObject subclass with dynamically added implementations for custom selectors.


## What’s Inside

There’s `RAExpendable`, you use it when you’re dealing with an inline object that needs delegation to work, and would not wish to create separate classes for them, or when you’re dealing with multiple inline objects which are all chatty, and require delegation to cover the whole gamut of their behavior.

Here’s a snippet from its test:

	RAExpendable *expendable = [RAExpendable new];
	STAssertThrows([expendable performSelector:@selector(foo)], @"object should not answer to selector yet");
	
	[expendable addMethodForSelector:@selector(foo) types:"v@:" block:^{
		NSLog(@"Foo");
	}];
	STAssertNoThrow([expendable performSelector:@selector(foo)], @"object should answer to selector");

Drop the Xcode project into your project, then link against it as a static library.


## Licensing

This project is in the public domain.  You can use it and embed it in whatever application you sell, and you can use it for evil.  However, it is appreciated if you provide attribution, by linking to the project page ([https://github.com/evadne/RAExpendable](https://github.com/evadne/RAExpendable)) from your application.


## Credits

*	[Evadne Wu](http://twitter.com/evadne) at Radius ([Info](http://radi.ws))