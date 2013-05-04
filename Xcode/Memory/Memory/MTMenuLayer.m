//
//  MTMenuLayer.m
//  Memory
//
//  Created by Thomas Therrien on 2/17/13.
//  Copyright (c) 2013 Thomas Therrien. All rights reserved.
//

#import "MTMenuLayer.h"

@implementation MTMenuLayer

-(void) startGameEasy {
    [[CCDirector sharedDirector] replaceScene: [MTPlayfieldScene sceneWithRows:3 andColumns:4]];
}

@end
