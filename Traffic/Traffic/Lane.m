//
//  Lane.m
//  Traffic
//
//  Created by Thomas Therrien on 2/3/13.
//  Copyright (c) 2013 Thomas Therrien. All rights reserved.
//

#import "Lane.h"
#import "TrafficController.h"
@implementation Lane

-(void) awakeFromNib
{
    [_controller registerLane:self];
    srandom(time(NULL));
    [self start];
}
-(void)start
{
    long newStartTime = random() % 200;
    carStartTimer = [NSTimer scheduledTimerWithTimeInterval:newStartTime / 1000.0 target:self selector:@selector(startTimerFired:) userInfo:nil repeats:YES];
}
-(void) startTimerFired:(NSTimer*)timer
{
    long newStartTime = random() % 1500 + 500;
    [timer setFireDate:[NSDate dateWithTimeIntervalSinceNow:newStartTime / 1000.0]];
    [_controller startCarFromLane:self];
    NSLog(@"Car Started");
}

-(void)stop
{
    [carStartTimer invalidate];
    carStartTimer = nil;
}
@end
