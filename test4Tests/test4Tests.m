//
//  test4Tests.m
//  test4Tests
//
//  Created by Curtis Kang on 6/8/15.
//  Copyright (c) 2015 Curtis Kang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "ViewController.h"

@interface test4Tests : XCTestCase

@property (strong, nonatomic) ViewController *vc;

@end

@implementation test4Tests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    UIStoryboard *storyboard = [ UIStoryboard storyboardWithName:@"Main" bundle:nil];
    self.vc = [storyboard instantiateInitialViewController];
   
    [self.vc performSelectorOnMainThread:@selector(loadView) withObject:nil waitUntilDone:YES];
    
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    XCTAssert(YES, @"Pass");
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

- (void)testDisplayTotalAmountFor123
{
    [self.vc displayTotalAmount:123];
    NSString *result = self.vc.billAmount.text;
    XCTAssertEqualObjects(result, @"$123.00");
    
    
}

@end
