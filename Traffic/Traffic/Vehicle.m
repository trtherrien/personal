//
//  Vehicle.m
//  Traffic
//
//  Created by Thomas Therrien on 2/1/13.
//  Copyright (c) 2013 Thomas Therrien. All rights reserved.
//

#import "Vehicle.h"
#import "TrafficController.h"

@implementation Vehicle

- (id)initWithName:(NSString*)name {
    UIImage* loadedImage = [UIImage imageNamed:name ];
    CGRect rect = CGRectMake(0, 0, loadedImage.size.width, loadedImage.size.height);
    self = [super initWithFrame:rect];
    _speed = 125;
    image = loadedImage;
    if (self) {
        // Initialization code
        self.opaque = NO;
        self.backgroundColor =  [UIColor clearColor];

    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    [image drawInRect:rect];
    // Drawing code
}

-(void) touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch* aTouch = [touches anyObject];
    Lane* lane = [self.controller laneAtPoint:[aTouch locationInView:self.superview]];
    if (lane) {
        self.goalLane = lane;
    }
}

@end
