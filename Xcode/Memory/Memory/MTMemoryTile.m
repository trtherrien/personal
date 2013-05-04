//
//  MTMemoryTile.m
//  Memory
//
//  Created by Thomas Therrien on 2/23/13.
//  Copyright (c) 2013 Thomas Therrien. All rights reserved.
//

#import "MTMemoryTile.h"

@implementation MTMemoryTile

-(void) dealloc {
    self.faceSpriteName = nil;
    [super dealloc];
}

-(void) showFace {
    [self setDisplayFrame:[[CCSpriteFrameCache sharedSpriteFrameCache]spriteFrameByName:self.faceSpriteName]];
    self.isFaceUp = YES;
}

-(void) showBack {
    [self setDisplayFrame:[[CCSpriteFrameCache sharedSpriteFrameCache]spriteFrameByName:@"tileback.png"]];
    self.isFaceUp = NO;
}

-(void) changeTile {
    if (self.isFaceUp) {
        [self showBack];
    } else {
        [self showFace];
    }
}

-(void) flipTile {
    float duration = 0.25f;
    CCOrbitCamera* rotateToEdge = [ CCOrbitCamera actionWithDuration:duration/2 radius:1 deltaRadius:0 angleZ:0 deltaAngleZ:90 angleX:0 deltaAngleX:0];
    CCOrbitCamera *rotateFlat = [ CCOrbitCamera actionWithDuration:duration/2 radius:1 deltaRadius:0 angleZ:270 deltaAngleZ:90 angleX:0 deltaAngleX:0];
    [self runAction:[CCSequence actions: rotateToEdge, [CCCallFunc actionWithTarget:self selector:@selector(changeTile)], rotateFlat, nil]];
    //[[SimpleAudioEngine sharedEngine]playEffect:SND_TILE_FLIP];
}

-(BOOL) containsToachLocation:(CGPoint)pos {
    return CGRectContainsPoint(self.boundingBox, pos);
}

@end
