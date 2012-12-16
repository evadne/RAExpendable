//
//  RAExpendableTests.m
//  RAExpendableTests
//
//  Created by Evadne Wu on 12/15/12.
//  Copyright (c) 2012 Radius. All rights reserved.
//

#import "RAExpendable.h"
#import "RAExpendableTests.h"

@implementation RAExpendableTests

- (void) testExample {

	RAExpendable *expendable = [RAExpendable new];
	STAssertThrows([expendable performSelector:@selector(foobar)], @"object should not answer to selector yet");
	
	[expendable addMethodForSelector:@selector(foo) types:"v@:" block:^{
		NSLog(@"Foo");
	}];
	STAssertNoThrow([expendable performSelector:@selector(foo)], @"object should answer to selector");
	
	[expendable addMethodForSelector:@selector(bar) types:"v@:" block:^{
		NSLog(@"Bar");
	}];
	STAssertNoThrow([expendable performSelector:@selector(bar)], @"object should answer to selector");

}

@end
