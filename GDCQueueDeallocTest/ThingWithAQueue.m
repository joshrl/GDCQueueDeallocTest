//
//  ThingWithAQueue.m
//  GDCDeallocTest
//
//  Created by Josh Rooke-Ley on 1/16/12.
//  Copyright (c) 2012 R/GA. All rights reserved.
//

#import "ThingWithAQueue.h"

@interface ThingWithAQueue () 
{
    dispatch_queue_t _queue;
}

@end

@implementation ThingWithAQueue



- (void)dealloc
{
    NSLog(@"Dealloc in Thing");
    dispatch_release(_queue);
    _queue = nil;
}


- (void)addSomeWork1:(void(^)(void))work
{
    
    if (!_queue)
        _queue = dispatch_queue_create("com.johsrl.ThingQueue", NULL);
 
    dispatch_async(_queue, ^{
        work();
        //Since I refer to self here, dealloc will not be run until after all blocks complete
        NSLog(@"Work is done: %@",self);
    });
    
}

- (void)addSomeWork2:(void(^)(void))work
{
    
    if (!_queue)
        _queue = dispatch_queue_create("com.johsrl.ThingQueue", NULL);
    
    dispatch_async(_queue, ^{
        work();
        //Thing not referenced in block, therefore dealloc may be called before this runs...
        NSLog(@"Work is done (but thing may not be valid anymore)");
    });
    
    
}

@end
