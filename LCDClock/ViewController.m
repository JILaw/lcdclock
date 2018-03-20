//
//  ViewController.m
//  LCDClock
//
//  Created by PK/PQ Computer on 3/2/18.
//  Copyright © 2018 PK/PQ Computer. All rights reserved.
//

#import "ViewController.h"
#import "DigitView.h"
#import "SettingsViewController.h"
#import "Settings.h"

@interface ViewController () <UIGestureRecognizerDelegate> {
	NSTimer *timer;
	SettingsViewController *svc;
	
	
}

@property (weak, nonatomic) IBOutlet UIView *blinkerTop;
@property (weak, nonatomic) IBOutlet UIView *blinkerBottom;



@property (weak, nonatomic) IBOutlet DigitView *digitTwo;
@property (weak, nonatomic) IBOutlet DigitView *digitOne;
@property (weak, nonatomic) IBOutlet DigitView *digitThree;
@property (weak, nonatomic) IBOutlet DigitView *digitFour;

@property (weak, nonatomic) IBOutlet UIButton *settingsButton;


@property (nonatomic) NSTimeZone *selectedTimeZone;

@property (nonatomic) UIColor *selectedColor;





@end

@implementation ViewController

BOOL is24Hour;




- (IBAction)settings:(id)sender {
	// segues to SettingsViewController
	
}

- (void)handleTapFrom:(UITapGestureRecognizer *)recognizer
{
	NSLog (@"SCREEN WAS TAPPED!");
	// set settingsButton to 'not hidden'
	_settingsButton.hidden = NO;
	
}

- (void)viewDidLoad {
	[super viewDidLoad];
	
	//[NSTimer scheduledTimerWithTimeInterval:0.5f target:self selector:@selector(executeTimerEvent:) userInfo:nil repeats:YES];
	
	
	
	// hide settingsButton
	_settingsButton.hidden = YES;
	
	UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTapFrom:)];
	
	
	[self.view addGestureRecognizer:tapGestureRecognizer];
	tapGestureRecognizer.delegate = self;
	
	[self updateClock];
	
	
	// update the clock with timer
	
	timer = [NSTimer scheduledTimerWithTimeInterval:0.5
											 target:self
										   selector:@selector(updateClock)
										   userInfo:nil
											repeats:YES];
}


-(void)viewWillAppear:(BOOL)animated {
	[super viewWillAppear:animated];
	
	NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
	NSData *encodedObject = [defaults objectForKey:@"NSUDS-SAVE-DATA"];
	
	Settings *settings = [NSKeyedUnarchiver unarchiveObjectWithData:encodedObject];
	
	self.selectedTimeZone = settings.selectedTimeZone;
	self.is24Hour = settings.is24Hour;
	
	_blinkerTop.backgroundColor = settings.selectedColor;
	_blinkerBottom.backgroundColor = settings.selectedColor;
	
	[_digitOne setBarsToSelectedColor:settings.selectedColor];
	[_digitTwo setBarsToSelectedColor:settings.selectedColor];
	[_digitThree setBarsToSelectedColor:settings.selectedColor];
	[_digitFour setBarsToSelectedColor:settings.selectedColor];

	[self updateClock];
	
	
}


//-(void)viewDidDisappear:(BOOL)animated {
//	[super viewDidDisappear:animated];
//	[timer invalidate];
//
//}

-(void)updateClock
{
	// get time using NSDate, format into HH:MM or hh:mm, use stringFromDate to get "timeString"
	
	NSDate *time = [NSDate date];
	NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
	
	// set time zone from picker data 'selectedTimeZone' abbreviation
	
	NSLog (@"Time Zone is: %@", self.selectedTimeZone);
	[formatter setTimeZone: self.selectedTimeZone];
	
	
	// check for 12 or 24 hour format setting, format accordingly
	if (self.is24Hour != YES)  {
		[formatter setDateFormat:@"hh:mm"];
		
	} else {
		[formatter setDateFormat:@"HH:mm"];
	}
	
	
	
	
	NSString *timeString = [formatter stringFromDate:time];
	
	// log current time, see if it's working
	NSLog  (@"Current time is: %@", timeString);
	
	// remove colon from timeString
	NSString *timeStringNoColon = [timeString
								   stringByReplacingOccurrencesOfString:@":" withString:@""];
	
	// assign each character in string to a variable: h1, h2, s1, s2
	
	char h1 = [timeStringNoColon characterAtIndex:0];
	char h2 = [timeStringNoColon characterAtIndex:1];
	char s1 = [timeStringNoColon characterAtIndex:2];
	char s2 = [timeStringNoColon characterAtIndex:3];
	
	// set each variable to a digit
	self.digitOne.digit  = h1;
	self.digitTwo.digit  = h2;
	self.digitThree.digit  = s1;
	self.digitFour.digit  = s2;
	
	
	[self executeTimerEvent: nil];
	
	
}

- (void) executeTimerEvent:(NSTimer *)timer {
	// Handle the timed event.
	
	
	//Settings *settings = [NSKeyedUnarchiver unarchiveObjectWithData:encodedObject];
	
	
	
	
	
	
	
	
	
	if (_blinkerTop.hidden == YES) {
		_blinkerTop.hidden = NO;
		NSLog (@"it is hidden");
	} else {
		_blinkerTop.hidden = YES;
		NSLog (@"it is not hidden");
	}
	
	if (_blinkerBottom.hidden == YES) {
		_blinkerBottom.hidden = NO;
		NSLog (@"it is hidden");
	} else {
		_blinkerBottom.hidden = YES;
		NSLog (@"it is not hidden");
	}
	

	
}


	



- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}
//



@end
