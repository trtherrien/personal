//
//  Lane.h
//  Traffic
//
//  Created by Thomas Therrien on 2/3/13.
//  Copyright (c) 2013 Thomas Therrien. All rights reserved.
//

#import <Foundation/Foundation.h>
@class TrafficController;
@interface Lane : UIView
{
    NSTimer* carStartTimer;
}
@property (nonatomic, retain) IBOutlet TrafficController* controller;
-(void)start;
-(void)stop;
@end
