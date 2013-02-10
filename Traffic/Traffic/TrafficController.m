//
//  TrafficController.m
//  Traffic
//
//  Created by Thomas Therrien on 2/2/13.
//  Copyright (c) 2013 Thomas Therrien. All rights reserved.
//

#import "TrafficController.h"
#import "Lane.h"

@implementation TrafficController
-(void) awakeFromNib {
    vehicles = [NSMutableArray arrayWithCapacity:10];
    vehiclesToDestroy = [NSMutableArray arrayWithCapacity:10];
    lanes = [NSMutableArray arrayWithCapacity:3];
    timeRemaining = 20;
}

-(void) registerVehicle:(Vehicle*)vehicle {
    [vehicles addObject:vehicle];
}
-(void) registerLane:(Lane*)lane {
    [lanes addObject:lane];
}
-(void) stopGame {
    NSLog(@"Stopping Game");
    [self.viewController displayGameOver];
}
-(void) startGame {
    displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(update:)];
    [displayLink addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSRunLoopCommonModes];
}
-(void) update:(CADisplayLink*)sender {
    if (lasTTimeStamp <= 0)
    {
        lasTTimeStamp = sender.timestamp;
    }
    CGFloat deltaTime = sender.timestamp - lasTTimeStamp;
    timeRemaining -= deltaTime;
        
    for (Vehicle* v in vehicles)
    {
        CGPoint position = v.center;
        CGFloat speed = v.speed;
        position.y -= speed * deltaTime;
        CGFloat lateralSpeed = 200;
        if (v.goalLane != nil) {
            CGPoint goalLanePosition = v.goalLane.center;
            CGFloat deltaX = fabs(goalLanePosition.x - position.x);
            if (deltaX < 3) {
                position.x = goalLanePosition.x;
            }
            if (position.x > goalLanePosition.x) {
                position.x -= lateralSpeed * deltaTime;
            } else if (position.x < goalLanePosition.x) {
                position.x += lateralSpeed * deltaTime;
            }
        }
        v.center = position;
        if (position.y < -50) {
            [self vehicleReachedEndOfRoad:v];
        }
        //Detect collision
        for (Vehicle* otherVehicle in vehicles) {
            if (otherVehicle == v) continue;
            //inset by 7 pixels to leave a degree of tolerance
            CGRect myRect = CGRectInset(v.frame, 7, 7);
            CGRect otherRect = CGRectInset(otherVehicle.frame, 7, 7);
            if(CGRectIntersectsRect(myRect, otherRect)) {
                [self vehicle:v collidedWithVehicle:otherVehicle];
                return;
            }
        }
        [self.viewController setTimeRemaining:timeRemaining];
        if (timeRemaining < 0) {
            //game over
            if (!displayLink.paused){
                [self togglePause];
            }
            [self.viewController displayGameOver];
        }
        

    }
    for (Vehicle* v in vehiclesToDestroy) {
        [vehicles removeObject:v];
    }
    [vehiclesToDestroy removeAllObjects];
    lasTTimeStamp = sender.timestamp;
}

-(Lane*)laneAtPoint:(CGPoint)point {
    for(Lane* lane in lanes) {
        if (CGRectContainsPoint([lane frame], point)) {
            return lane;
        }
    }
    return nil;
}

- (void) startCarFromLane:(Lane*)starter
{
    NSString* carType;
    int type = random() % 3;
    switch (type)
    {
        case 0:
            carType = @"GreenCar";
            break;
        case 1:
            carType = @"RedCar";
            break;
        case 2:
            carType = @"BlueCar";
            break;
    }
    Vehicle* v = [[Vehicle alloc] initWithName:carType];
    [_viewController.view addSubview:v];
    [self registerVehicle:v];
    v.goalTag = type;
    v.controller = self;
    CGPoint position;
    position.x = starter.center.x;
    position.y = 480;
    v.center = position;
    
}

-(void) vehicle:(Vehicle*) aVehicle collidedWithVehicle:(Vehicle*) otherVehicle{
    if (!displayLink.paused) {
        [self togglePause];
        [self stopGame];
    }
}

-(void) togglePause {
    displayLink.paused = !displayLink.paused;
    if (displayLink.paused){
        for (Vehicle* v in vehicles) {
            v.userInteractionEnabled = NO;
        }
        for (Lane* l in lanes) {
            [l stop];
        }
    } else {
        for (Vehicle* v in vehicles) {
            v.userInteractionEnabled = YES;
        }
        for (Lane* l in lanes) {
            [l start];
        }
    }
}

-(BOOL) isPaused {
    return displayLink.paused;
}

-(void) vehicleReachedEndOfRoad:(Vehicle*) v {
    [v removeFromSuperview];
    [vehiclesToDestroy addObject:v];
    if (v.goalTag == v.goalLane.tag) {
        timeRemaining += 2.0;
    } else {
        // car did not reach goal - no reward
    }
}
@end
