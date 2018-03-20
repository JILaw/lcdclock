//
//  Settings.m
//  LCDClock
//
//  Created by PK/PQ Computer on 3/12/18.
//  Copyright © 2018 PK/PQ Computer. All rights reserved.
//

#import "Settings.h"

@implementation Settings



- (void)encodeWithCoder:(NSCoder *)encoder
{
	//Encode properties, other class variables, etc
	NSLog(@"Encoder Called");
	[encoder encodeObject:[self selectedColor] forKey:@"selectedColor"];
	[encoder encodeObject:[self selectedTimeZone] forKey:@"selectedTimeZone"];
	[encoder encodeBool:[self is24Hour] forKey:@"is24Hour"];
}

- (id)initWithCoder:(NSCoder *)decoder
{
	NSLog(@"Decoder Called");
	self = [super init];
	if(self)
	{
		//decode properties, other class vars
		[self setSelectedColor:[decoder decodeObjectForKey:@"selectedColor"]];
		[self setSelectedTimeZone:[decoder decodeObjectForKey:@"selectedTimeZone"]];
		[self setIs24Hour:[decoder decodeBoolForKey:@"is24Hour"]];
	}
	return self;
}

@end
