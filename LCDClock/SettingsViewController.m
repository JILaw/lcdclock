//
//  SettingsViewController.m
//  LCDClock
//
//  Created by PK/PQ Computer on 3/8/18.
//  Copyright © 2018 PK/PQ Computer. All rights reserved.
//

#import "SettingsViewController.h"
#import "Settings.h"

@interface SettingsViewController (){
	Settings *settings;

// ? Mutable below to change objects in picker after selection?

	//NSArray *_pickerData;
	
	NSArray * _arrayForKeys;
	NSArray * _arrayForValues;
	
	NSDictionary *timeZoneDict;


	NSTimeZone *_selectedTimeZone;
	
	BOOL is24Hour;
	

}

@end

@implementation SettingsViewController



-(void) saveSettings {
	
	NSData *encodedObject = [NSKeyedArchiver archivedDataWithRootObject:settings];
	NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
	[defaults setObject:encodedObject forKey:@"NSUDS-SAVE-DATA"];
	//[defaults synchronize];
	[[NSUserDefaults standardUserDefaults] synchronize];
	
	
	NSLog(@"Data Saved");
	
}


- (IBAction)digitsLightGreen:(UIButton*)sender {
	
	settings.selectedColor = self.lightGreenOutlet.backgroundColor;
	
	[self showSelection:sender];
	
	[self saveSettings];
	
}



- (IBAction)digitsRed:(UIButton*)sender {
	
	settings.selectedColor = self.redOutlet.backgroundColor;
	
	[self showSelection:sender];

	[self saveSettings];
	
}

- (IBAction)digitsBlue:(UIButton*)sender {
	
	settings.selectedColor = self.blueOutlet.backgroundColor;
	
	[self showSelection:sender];
	
	[self saveSettings];
	
}

- (IBAction)digitsDarkGreen:(UIButton*)sender {
	
	settings.selectedColor = self.darkGreenOutlet.backgroundColor;
	
	[self showSelection:sender];
	
	[self saveSettings];
	
	
}


- (IBAction)twentyFourHour:(id)sender  {
	if ([self.twentyFourHour isOn]) {
		NSLog(@"Switch is on");
		[self.twentyFourHour setOn:YES animated:YES];
		settings.is24Hour = YES;
	} else {
		
		[self.twentyFourHour setOn:NO animated:YES];
		
		NSLog(@"Switch is off");
		settings.is24Hour = NO;
	}
	[self saveSettings];
}

// Catpure the picker view selection
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
	// This method is triggered whenever the user makes a change to the picker selection.
	// The parameter named row and component represents what was selected.
	
	NSString *theRowValue = [NSString stringWithFormat:@"%@",[_arrayForKeys objectAtIndex:row]];

	NSString *theRowAbbr = [NSString stringWithFormat:@"%@",[_arrayForValues objectAtIndex:row]];

	
	
	NSLog (@"The Row Value is: %@", theRowValue);
	
	NSLog (@"The value for selectedTimeZone is: %@", settings.selectedTimeZone);
	
	settings.selectedTimeZone = [NSTimeZone timeZoneWithAbbreviation:theRowAbbr];

	
	
	[self saveSettings];
}


- (void)viewDidLoad {
	
    [super viewDidLoad];
	
	
	timeZoneDict = @{
					 @"Mountain Standard Time":@"MST",
					 @"Central Standard Time":@"CST",
					 @"Eastern Daylight Time":@"EDT",
					 @"Pacific Daylight Time":@"PDT"
					 
					 };
	
	_arrayForKeys = timeZoneDict.allKeys;
	
	
	_arrayForValues = timeZoneDict.allValues;


	// connect data
	self.picker.dataSource = self;
	self.picker.delegate = self;
	
    // Do any additional setup after loading the view from its nib.
	//settings = [[Settings alloc]init];
	NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
	NSData *encodedObject = [defaults objectForKey:@"NSUDS-SAVE-DATA"];
	if(encodedObject==nil){
		settings = [[Settings alloc]init];
	}
	else {
		settings = [NSKeyedUnarchiver unarchiveObjectWithData:encodedObject];
	}
	
	[self showSelection: nil];
	
	
	
	if([settings.selectedColor isEqual:self.blueOutlet.backgroundColor]){
		[self showSelection: self.blueOutlet];
	}
	if([settings.selectedColor isEqual:self.redOutlet.backgroundColor]){
		[self showSelection: self.redOutlet];
	}
	if([settings.selectedColor isEqual:self.lightGreenOutlet.backgroundColor]){
		[self showSelection: self.lightGreenOutlet];
	}
	if([settings.selectedColor isEqual:self.darkGreenOutlet.backgroundColor]){
		[self showSelection: self.darkGreenOutlet];
	}
	
	if (settings.is24Hour == YES) {
		[self.twentyFourHour setOn: YES animated:YES];
	} else {
		[self.twentyFourHour setOn: NO animated:YES];
	}
	
	
	
	//selectRow:inComponent:animated:
	
	
	//[self.picker selectRow:2 inComponent:0 animated:YES];
	
	NSString *abbr =  settings.selectedTimeZone.abbreviation;
	NSLog(@"abb: %@", abbr);
	
	if ([settings.selectedTimeZone.abbreviation isEqualToString: (@"MST")]) {
		[self.picker selectRow:3 inComponent:0 animated:YES];
	}
	if ([abbr isEqualToString: (@"CDT")]){
		[self.picker selectRow:1 inComponent:0 animated:YES];
	}
	if ([abbr isEqualToString: (@"EDT")]){
		[self.picker selectRow:0 inComponent:0 animated:YES];
	}
	if ([abbr isEqualToString: (@"PDT")]) {
		[self.picker selectRow:2 inComponent:0 animated:YES];
	}




}

-(void) showSelection:(UIView*)btn {
	self.redOutlet.alpha = 0.3;
	self.lightGreenOutlet.alpha = 0.3;
	self.darkGreenOutlet.alpha = 0.3;
	self.blueOutlet.alpha = 0.3;
	
	btn.alpha = 1;
}






- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



// The number of columns of data
- (long)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
	return 1;
}

// The number of rows of data
- (long)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
	return _arrayForKeys.count;
}

// The data to return for the row and component (column) that's being passed in
- (NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
	
	return _arrayForKeys[row];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/




- (IBAction)donePressed:(id)sender {
	
	[self.presentingViewController dismissViewControllerAnimated:YES completion:NULL];
}
@end
