//
//  RAExpendable.h
//  RAExpendable
//
//  Created by Evadne Wu on 12/15/12.
//  Copyright (c) 2012 Radius. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>

@interface RAExpendable : NSObject

- (void) addMethodForSelector:(SEL)selector types:(const char *)types block:(id)block;

@end
