//
//  DigitView.h
//  LCDClock
//
//  Created by PK/PQ Computer on 3/2/18.
//  Copyright © 2018 PK/PQ Computer. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DigitView : UIView



@property (weak, nonatomic) IBOutlet UIView *contentView;

@property (weak, nonatomic) IBOutlet UIView *CenterLowBar;
@property (weak, nonatomic) IBOutlet UIView *LeftLowerBar;
@property (weak, nonatomic) IBOutlet UIView *LeftHigherBar;
@property (weak, nonatomic) IBOutlet UIView *CenterMiddleBar;
@property (weak, nonatomic) IBOutlet UIView *CenterHighBar;
@property (weak, nonatomic) IBOutlet UIView *RightLowerBar;
@property (weak, nonatomic) IBOutlet UIView *RightHigherBar;

-(void)setDigit:(int)digit;



-(void)renderOne;
-(void)renderTwo;
-(void)renderThree;
-(void)renderFour;
-(void)renderFive;
-(void)renderSix;
-(void)renderSeven;
-(void)renderEight;
-(void)renderNine;
-(void)renderZero;

-(void) setBarsToSelectedColor:(UIColor*)selectedColor;





@end
