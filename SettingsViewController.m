//
//  SettingsViewController.m
//  test4
//
//  Created by Curtis Kang on 6/12/15.
//  Copyright (c) 2015 Curtis Kang. All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()

@end

@implementation SettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *a= [defaults objectForKey:@"user_data1"];
    NSInteger *defaultAmount= [defaults integerForKey:@"user_data2"];
    
    
    NSString *strFromInt = [NSString stringWithFormat:@"%d", defaultAmount];
    NSLog(@"%@", a);
    NSLog(@"%@",strFromInt);
    self.prefSetting1.text= strFromInt;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)defaultAmountChanged:(id)sender {
    NSLog(@"changed");
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:@"hello" forKey:@"user_data1"];
    [defaults setInteger:[self.prefSetting1.text integerValue] forKey:@"user_data2"];
    [defaults synchronize];

}
@end
