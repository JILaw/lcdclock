//
//  ViewController.h
//  LCDClock
//
//  Created by PK/PQ Computer on 3/2/18.
//  Copyright © 2018 PK/PQ Computer. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DigitView.h"

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet DigitView *digitView;

@property BOOL is24Hour;

-(void) updateClock;
-(void) handleTapFrom:(UITapGestureRecognizer *)recognizer;

//-(void) setTimeToTwelveOrTwentyFour;






@end

