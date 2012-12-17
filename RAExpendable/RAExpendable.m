//
//  RAExpendable.m
//  RAExpendable
//
//  Created by Evadne Wu on 12/15/12.
//  Copyright (c) 2012 Radius. All rights reserved.
//

#import "RAExpendable.h"

@interface RAExpendable ()
@end

@implementation RAExpendable

- (void) subclassIfNeeded {

	if ([self class] == [RAExpendable class]) {
	
		CFUUIDRef uuid = CFUUIDCreate(NULL);
		CFStringRef uuidString;
		if (uuid) {
			uuidString = CFUUIDCreateString(NULL, uuid);
			CFRelease(uuid);
		}
		
		const char *className = [[@[
			NSStringFromClass([self class]),
			(__bridge_transfer NSString *)uuidString
		] componentsJoinedByString:@"-"] UTF8String];
		
		Class subclass = objc_allocateClassPair([self class], className, 0);
		object_setClass(self, subclass);
	
	}

}

- (void) addMethodForSelector:(SEL)selector types:(const char *)types block:(id)block {

	[self subclassIfNeeded];
	
	class_addMethod([self class], selector, imp_implementationWithBlock(block), types);
	
}

- (void) dealloc {

	if ([self class] != [RAExpendable class]) {
		
		//	If somebody is using KVO, they will be screwed.
		
		Class class = [self class];
		
		dispatch_async(dispatch_get_main_queue(), ^{
		
			objc_disposeClassPair(class);
			
		});
	
	}

}

@end
