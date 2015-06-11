//
//  ViewController.m
//  test4
//
//  Created by Curtis Kang on 6/8/15.
//  Copyright (c) 2015 Curtis Kang. All rights reserved.
//

#import "ViewController.h"
#import "SettingsViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self displayKeyboard];
     self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Settings" style:UIBarButtonItemStylePlain target:self action:@selector(onSettingsButton)];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:@"hello" forKey:@"user_data1"];
    [defaults setInteger:0 forKey:@"user_data2"];
    [defaults synchronize];
    [defaults integerForKey:@"user_data2"];
   
}
- (void)displayKeyboard {
    [self.billAmount becomeFirstResponder];
}

- (void)dismissKeyboard {
    [self.billAmount resignFirstResponder];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




- (IBAction)tipPercentChanged:(id)sender {
    [self updateDisplayedTip];
    [self updateDisplayedTotal];
    [self dismissKeyboard];
}

- (NSString *)formatCurrency:(float)amount
{
    NSNumberFormatter *nf = [[NSNumberFormatter alloc] init];
    nf.numberStyle = NSNumberFormatterCurrencyStyle;
    NSNumber *number = [NSNumber numberWithInt:amount];
    return [nf stringFromNumber:number];
}

- (void)displayTotalAmount:(float)amount
{
    self.billAmount.text = [self formatCurrency:amount];
}

- (void)displayTipAmount:(float)amount
{
    self.tipAmount.text = [self formatCurrency:amount];
}

- (float)calculateTipPercentageForSegment:(int)segment
{
    NSString *tipText = [self.tipPercent titleForSegmentAtIndex:segment];
    return [tipText floatValue] / 100.0;
}

- (float)getBillAmount
{
    return [self.billAmount.text floatValue];
}
- (float)calculateTipAmount:(float)amount percent:(float)percent
{
    return amount * percent;
}

- (void)updateDisplayedTip
{
    float amount = [self getBillAmount];
    int segment = self.tipPercent.selectedSegmentIndex;
    float percent = [self calculateTipPercentageForSegment:segment];
    float tip = [self calculateTipAmount:amount percent:percent];
    self.tipAmount.text = [self formatCurrency:tip];
}
- (void)updateDisplayedTotal
{
    float amount = [self getBillAmount];
    int segment = self.tipPercent.selectedSegmentIndex;
    float percent = [self calculateTipPercentageForSegment:segment];
    float tip = [self calculateTipAmount:amount percent:percent];
    self.totalAmount.text = [self formatCurrency:tip+amount];

}

- (void)clearDisplayTipAndTotal
{
    self.billAmount.text = @"";
    self.tipAmount.text = @"";
    self.totalAmount.text = @"";
    
    
}


- (IBAction)onTap:(id)sender {
    [self.view endEditing:YES];
}
- (void)onSettingsButton {
   // self.billAmount.text = @"99";
    
    [self.navigationController pushViewController:[[SettingsViewController alloc] init] animated:YES];
    

}

- (void)viewWillAppear:(BOOL)animated {
    NSLog(@"view will appear");
}

- (void)viewDidAppear:(BOOL)animated {
    NSLog(@"view did appear");
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSInteger *defaultAmount= [defaults integerForKey:@"user_data2"];
    NSString *strFromInt = [NSString stringWithFormat:@"%d", defaultAmount];
    
    self.billAmount.text =strFromInt;

}

- (void)viewWillDisappear:(BOOL)animated {
    NSLog(@"view will disappear");
}

- (void)viewDidDisappear:(BOOL)animated {
    NSLog(@"view did disappear");
}



@end
