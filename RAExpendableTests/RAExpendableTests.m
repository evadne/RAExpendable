

#import <SenTestingKit/SenTestingKit.h>
#import "RAExpendable.h"

@interface RAExpendableTests : SenTestCase @end

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

- (void) testWithAnyObject {

  NSMutableArray *expendable = @[@"a", @"b", @2].mutableCopy;
	STAssertThrows([expendable performSelector:@selector(foobar)], @"object should not answer to selector yet");
	
	[expendable addMethodForSelector:@selector(foo) types:"v@:" block:^{
		NSLog(@"Foo");
	}];
	STAssertNoThrow([expendable performSelector:@selector(foo)], @"object should answer to selector");
	
	[expendable addMethodForSelector:@selector(bar) types:"v@:" block:^{
		NSLog(@"Bar");
	}];
	STAssertNoThrow([expendable performSelector:@selector(bar)], @"object should answer to selector");

  __block __typeof(expendable) exp = expendable;
	[expendable addMethodForSelector:@selector(theFirstThing) types:"@@:" block:^id(void){
		return [exp objectAtIndex:0];
	}];
  id x;
	STAssertNoThrow(x = [expendable performSelector:@selector(theFirstThing)], @"object should answer to selector");
  STAssertTrue([ @"a" isEqualToString:x], @"should equal \"a\", but got %@", x);

}

@end
