//
//  CGirlBrick.m
//  Crazy Girl
//
//  Created by Thomas Therrien on 8/24/13.
//  Copyright (c) 2013 Tom Therrien. All rights reserved.
//

#import "CGirlBrick.h"

@implementation CGirlBrick

-(id) init {
    self = (CGirlBrick *)[SKSpriteNode spriteNodeWithImageNamed:@"block1"];
    CGSize boundry = self.size;
    boundry.height -= 5;
    boundry.width -= 5;
    self.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:boundry];
    self.physicsBody.affectedByGravity = NO;
    self.physicsBody.dynamic = NO;
    return self;
}


@end
