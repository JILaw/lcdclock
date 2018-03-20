//
//  SettingsViewController.h
//  LCDClock
//
//  Created by PK/PQ Computer on 3/8/18.
//  Copyright © 2018 PK/PQ Computer. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SettingsViewController : UIViewController <UIPickerViewDataSource, UIPickerViewDelegate>

- (IBAction)donePressed:(id)sender;



@property (weak, nonatomic) IBOutlet UIPickerView *picker;



@property (weak, nonatomic) IBOutlet UIButton *lightGreenOutlet;

@property (weak, nonatomic) IBOutlet UIButton *redOutlet;

@property (weak, nonatomic) IBOutlet UIButton *blueOutlet;

@property (weak, nonatomic) IBOutlet UIButton *darkGreenOutlet;


@property (weak, nonatomic) IBOutlet UISwitch *twentyFourHour;




- (IBAction)digitsLightGreen:(id)sender;

- (IBAction)digitsRed:(id)sender;

- (IBAction)digitsBlue:(id)sender;

- (IBAction)digitsDarkGreen:(id)sender;


- (IBAction)twentyFourHour:(id)sender;

@end



