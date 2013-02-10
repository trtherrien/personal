//
//  TrafficController.h
//  Traffic
//
//  Created by Thomas Therrien on 2/2/13.
//  Copyright (c) 2013 Thomas Therrien. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <QuartzCore/QuartzCore.h>
#import "Vehicle.h"
#import "Lane.h"
#import "TrafficViewController.h"

@interface TrafficController : NSObject
{
    CADisplayLink* displayLink;
    NSMutableArray* vehicles;
    NSMutableArray* vehiclesToDestroy;
    NSMutableArray* lanes;
    double timeRemaining;
    double lasTTimeStamp;
}
@property (strong, nonatomic) IBOutlet TrafficViewController* viewController;
@property (assign) BOOL paused;
-(void) startGame;
-(void) stopGame;
-(void) registerLane:(Lane*)lane;
-(void) registerVehicle:(Vehicle*)vehicle;
-(void) startCarFromLane:(Lane*)starter;
-(Lane*)laneAtPoint:(CGPoint)point;
-(void) togglePause;
-(BOOL) isPaused;
@end
