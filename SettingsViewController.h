//
//  SettingsViewController.h
//  test4
//
//  Created by Curtis Kang on 6/12/15.
//  Copyright (c) 2015 Curtis Kang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SettingsViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *prefSetting1;
- (IBAction)defaultAmountChanged:(id)sender;

@end
