//
//  Settings.h
//  LCDClock
//
//  Created by PK/PQ Computer on 3/12/18.
//  Copyright © 2018 PK/PQ Computer. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Settings : NSObject <NSCoding>


@property(nonatomic, strong) UIColor *selectedColor;
@property(nonatomic, strong) NSTimeZone *selectedTimeZone;
@property(nonatomic) BOOL is24Hour;




@end
