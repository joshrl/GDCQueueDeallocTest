//
//  ViewController.m
//  GDCDeallocTest
//
//  Created by Josh Rooke-Ley on 1/16/12.
//  Copyright (c) 2012 R/GA. All rights reserved.
//

#import "ViewController.h"
#import "ThingWithAQueue.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
}   

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (IBAction)test1:(id)sender {
    
    ThingWithAQueue *thing = [[ThingWithAQueue alloc] init];
    
    [thing addSomeWork1:^{sleep(1);}];
    [thing addSomeWork1:^{sleep(1);}];
    [thing addSomeWork1:^{sleep(1);}];
    [thing addSomeWork1:^{sleep(1);}];
    [thing addSomeWork1:^{sleep(1);}];
    
    NSLog(@"The view controller is done with test 1.");

}

- (IBAction)test2:(id)sender {
    
    ThingWithAQueue *thing = [[ThingWithAQueue alloc] init];

    [thing addSomeWork2:^{sleep(1);}];
    [thing addSomeWork2:^{sleep(1);}];
    [thing addSomeWork2:^{sleep(1);}];
    [thing addSomeWork2:^{sleep(1);}];
    [thing addSomeWork2:^{sleep(1);}];
    
    
    NSLog(@"The view controller is done with test 2.");
}
@end
