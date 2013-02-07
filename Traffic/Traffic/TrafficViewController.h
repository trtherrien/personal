//
//  TrafficViewController.h
//  Traffic
//
//  Created by Thomas Therrien on 2/1/13.
//  Copyright (c) 2013 Thomas Therrien. All rights reserved.
//

#import <UIKit/UIKit.h>
@class TrafficController;
@interface TrafficViewController : UIViewController
@property (nonatomic, retain) IBOutlet TrafficController* gameController;
@property (nonatomic, retain) IBOutlet UIView* pauseOverlay;
@property (nonatomic, retain) IBOutlet UILabel* timeRemainingLabel;
@property (nonatomic, retain) IBOutlet UIView* gameOverOverlay;
-(void)displayGameOver;
-(IBAction)pauseGame:(id)sender;
-(IBAction)endGame:(id)sender;
-(void)setTimeRemaining:(CGFloat)time;
-(IBAction)returned:(UIStoryboardSegue *)segue;
@end
