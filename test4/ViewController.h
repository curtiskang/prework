//
//  ViewController.h
//  test4
//
//  Created by Curtis Kang on 6/8/15.
//  Copyright (c) 2015 Curtis Kang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
- (IBAction)OnClick:(id)sender;

@property (weak, nonatomic) IBOutlet UITextField *billAmount;
@property (weak, nonatomic) IBOutlet UISegmentedControl *tipPercent;

@property (weak, nonatomic) IBOutlet UITextField *tipAmount;

- (IBAction)onTap:(id)sender;

@property (weak, nonatomic) IBOutlet UIBarButtonItem *rightBarButtonItem;

@property (weak, nonatomic) IBOutlet UITextField *totalAmount;
- (IBAction)tipPercentChanged:(id)sender;

- (void)displayTotalAmount:(float)amount;
- (void)displayTipAmount:(float)amount;
- (float)calculateTipPercentageForSegment:(int)segment;
- (float)getBillAmount;
- (float)calculateTipAmount:(float)amount percent:(float)percent;
- (void)updateDisplayedTip;
- (void)updateDisplayedTotal;
- (void)onSettingsButton;

@end

