//
//  MTMenuScene.m
//  Memory
//
//  Created by Thomas Therrien on 2/17/13.
//  Copyright (c) 2013 Thomas Therrien. All rights reserved.
//

#import "MTMenuScene.h"

@implementation MTMenuScene
+(id)scene {
    return([[[self alloc] init]autorelease]);
}

-(id) init {
    if((self=[super init])) {
        MTMenuLayer* layer = [MTMenuLayer node];
        [self addChild:layer];
    }
    return self;
}
@end
