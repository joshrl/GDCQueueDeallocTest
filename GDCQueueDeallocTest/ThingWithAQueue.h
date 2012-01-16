//
//  ThingWithAQueue.h
//  GDCDeallocTest
//
//  Created by Josh Rooke-Ley on 1/16/12.
//  Copyright (c) 2012 R/GA. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ThingWithAQueue : NSObject

- (void)addSomeWork1:(void(^)(void))work;
- (void)addSomeWork2:(void(^)(void))work;

@end
