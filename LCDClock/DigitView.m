//
//  DigitView.m
//  LCDClock
//
//  Created by PK/PQ Computer on 3/2/18.
//  Copyright © 2018 PK/PQ Computer. All rights reserved.
//

#import "DigitView.h"
#import "Settings.h"

@implementation DigitView {
	
	Settings *settings;
	
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithFrame:(CGRect)frame
{
	self = [super initWithFrame:frame];
	if (self) {
		[self prepare];
	}
	return self;
}


- (instancetype)initWithCoder:(NSCoder *)coder
{
	self = [super initWithCoder:coder];
	if (self) {
		[self prepare];
	}
	return self;
}


- (void)prepare {
	[[NSBundle mainBundle] loadNibNamed:@"DigitView" owner:self options:nil];
	[self addSubview:self.contentView];
 	self.contentView.frame = self.bounds;
	
	self.backgroundColor = [UIColor clearColor];
	
	
	
	
}



-(void)setDigit:(int)digit {
	

	switch (digit) {
		case '1':
			[self renderOne];
			break;
		case '2':
			[self renderTwo];
			break;
		case '3':
			[self renderThree];
			break;
		case '4':
			[self renderFour];
			break;
		case '5':
			[self renderFive];
			break;
		case '6':
			[self renderSix];
			break;
		case '7':
			[self renderSeven];
			break;
		case '8':
			[self renderEight];
			break;
		case '9':
			[self renderNine];
			break;
		case '0':
			[self renderZero];
		default:
			break;
	}
}



-(void) setBarsToSelectedColor:(UIColor*)selectedColor {
	

	[self.CenterLowBar setBackgroundColor: selectedColor];
	[self.CenterMiddleBar setBackgroundColor: selectedColor];
	[self.CenterHighBar setBackgroundColor: selectedColor];
	[self.LeftLowerBar setBackgroundColor: selectedColor];
	[self.LeftHigherBar setBackgroundColor: selectedColor];
	[self.RightLowerBar setBackgroundColor: selectedColor];
	[self.RightHigherBar setBackgroundColor:selectedColor];
}

-(void)renderOne {

	[self.CenterLowBar setAlpha:0.1];
	[self.CenterMiddleBar setAlpha:0.1];
	[self.CenterHighBar setAlpha:0.1];
	[self.LeftLowerBar setAlpha:0.1];
	[self.LeftHigherBar setAlpha:0.1];
	[self.RightLowerBar setAlpha:1.0];
	[self.RightHigherBar setAlpha:1.0];
	
	
	
	
}
-(void)renderTwo {
	
	
	
	[self.CenterLowBar setAlpha:1.0];
	[self.CenterMiddleBar setAlpha:1.0];
	[self.CenterHighBar setAlpha:1.0];
	[self.LeftLowerBar setAlpha:1.0];
	[self.LeftHigherBar setAlpha:0.1];
	[self.RightLowerBar setAlpha: 0.1];
	[self.RightHigherBar setAlpha:1.0];
}

-(void) renderThree {
	
	[self.CenterLowBar setAlpha:1.0];
	[self.CenterMiddleBar setAlpha:1.0];
	[self.CenterHighBar setAlpha:1.0];
	[self.LeftLowerBar setAlpha:0.1];
	[self.LeftHigherBar setAlpha: 0.1];
	[self.RightLowerBar setAlpha:1.0];
	[self.RightHigherBar setAlpha:1.0];
}

-(void) renderFour {
	
	
	
	[self.CenterLowBar setAlpha:0.1];
	[self.CenterMiddleBar setAlpha:1.0];
	[self.CenterHighBar setAlpha:0.1];
	[self.LeftLowerBar setAlpha:0.1];
	[self.LeftHigherBar setAlpha:1.0];
	[self.RightLowerBar setAlpha:1.0];
	[self.RightHigherBar setAlpha:1.0];
}

-(void) renderFive {
	

	[self.CenterLowBar setAlpha:1.0];
	[self.CenterMiddleBar setAlpha:1.0];
	[self.CenterHighBar setAlpha:1.0];
	[self.LeftLowerBar setAlpha:0.1];
	[self.LeftHigherBar setAlpha:1.0];
	[self.RightLowerBar setAlpha:1.0];
	[self.RightHigherBar setAlpha:0.1];
}

-(void) renderSix {
	

	[self.CenterLowBar setAlpha:1.0];
	[self.CenterMiddleBar setAlpha:1.0];
	[self.CenterHighBar setAlpha:1.0];
	[self.LeftLowerBar setAlpha:1.0];
	[self.LeftHigherBar setAlpha:1.0];
	[self.RightLowerBar setAlpha:1.0];
	[self.RightHigherBar setAlpha:0.1];
}

-(void) renderSeven {
	

	[self.CenterLowBar setAlpha:0.1];
	[self.CenterMiddleBar setAlpha:0.1];
	[self.CenterHighBar setAlpha:1.0];
	[self.LeftLowerBar setAlpha:0.1];
	[self.LeftHigherBar setAlpha:0.1];
	[self.RightLowerBar setAlpha:1.0];
	[self.RightHigherBar setAlpha:1.0];
}

-(void) renderEight {
	
	
	[self.CenterLowBar setAlpha:1.0];
	[self.CenterMiddleBar setAlpha:1.0];
	[self.CenterHighBar setAlpha:1.0];
	[self.LeftLowerBar setAlpha:1.0];
	[self.LeftHigherBar setAlpha:1.0];
	[self.RightLowerBar setAlpha:1.0];
	[self.RightHigherBar setAlpha:1.0];
}

-(void) renderNine {
	
	
	[self.CenterLowBar setAlpha:0.1];
	[self.CenterMiddleBar setAlpha:1.0];
	[self.CenterHighBar setAlpha:1.0];
	[self.LeftLowerBar setAlpha:0.1];
	[self.LeftHigherBar setAlpha:1.0];
	[self.RightLowerBar setAlpha:1.0];
	[self.RightHigherBar setAlpha:1.0];
}

-(void) renderZero {

	[self.CenterLowBar setAlpha:1.0];
	[self.CenterMiddleBar setAlpha: 0.1];
	[self.CenterHighBar setAlpha:1.0];
	[self.LeftLowerBar setAlpha:1.0];
	[self.LeftHigherBar setAlpha:1.0];
	[self.RightLowerBar setAlpha:1.0];
	[self.RightHigherBar setAlpha:1.0];
}
@end



