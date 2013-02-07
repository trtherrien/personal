//
//  Vehicle.h
//  Traffic
//
//  Created by Thomas Therrien on 2/1/13.
//  Copyright (c) 2013 Thomas Therrien. All rights reserved.
//

#import <UIKit/UIKit.h>
@class TrafficController;
@class Lane;
@interface Vehicle : UIView
{
    UIImage* image;
}
@property (assign) CGFloat speed;
@property (assign) int goalTag;
@property (nonatomic, retain) TrafficController* controller;
@property (readonly) BOOL slowed;
@property (nonatomic, retain) Lane* goalLane;
- (id)initWithName:(NSString*)name;
@end
