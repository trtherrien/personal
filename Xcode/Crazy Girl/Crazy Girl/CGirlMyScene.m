//
//  CGirlMyScene.m
//  Crazy Girl
//
//  Created by Thomas Therrien on 8/22/13.
//  Copyright (c) 2013 Tom Therrien. All rights reserved.
//

#import "CGirlMyScene.h"
#import "CGirlScore.h"
#import "CGirlBrick.h"

@implementation CGirlMyScene

SKSpriteNode *girl = nil;
CGirlScore *score;

-(id)initWithSize:(CGSize)size {    
    if (self = [super initWithSize:size]) {
        /* Setup your scene here */
        
        score = [[CGirlScore alloc]init];
        score.points = 10;
        
        self.backgroundColor = [SKColor colorWithRed:0.15 green:0.15 blue:0.3 alpha:1.0];
        
        SKLabelNode *myLabel = [SKLabelNode labelNodeWithFontNamed:@"Chalkduster"];
        
        myLabel.text = @"Crazy Girl";
        myLabel.fontSize = 30;
        myLabel.position = CGPointMake(CGRectGetMidX(self.frame),
                                       CGRectGetMidY(self.frame));
        
        [self addChild:myLabel];
        
        girl = [SKSpriteNode spriteNodeWithImageNamed:@"girl1"];
        CGPoint location = CGPointMake(50.0, 50.0);
        girl.position = location;
        
        girl.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:girl.size];
        girl.physicsBody.affectedByGravity = NO;
        girl.physicsBody.allowsRotation = NO;
        
        [self addChild:girl];
        
        CGirlBrick *block = [[CGirlBrick alloc]init];
        CGPoint bloc = CGPointMake(100.0, 100.0);
        block.position = bloc;
        [self addChild:block];
        block = [[CGirlBrick alloc]init];
        bloc = CGPointMake(150.0, 150.0);
        block.position = bloc;
        [self addChild:block];
        
    }
    return self;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    /* Called when a touch begins */
    
    for (UITouch *touch in touches) {
        SKAction *action = nil;
        CGPoint location = [touch locationInNode:self];
        [girl removeAllActions];
        
        if (location.y < girl.position.y + 18 && location.y > (girl.position.y - 22)) {
            if (location.x > girl.position.x) {
                action = [SKAction moveByX:20.0 y:0.0 duration:0.2];
            } else if (location.x < girl.position.x) {
                action = [SKAction moveByX:-20.0 y:0.0 duration:0.2];
            }
        } else {
            if (location.y > girl.position.y + 20) {
                action = [SKAction moveByX:0.0 y:20.0 duration:0.2];
            }
            if (location.y < girl.position.y - 22) {
                action = [SKAction moveByX:0.0 y:-20.0 duration:0.2];
            }
        }
        
        SKAction *repeater = [SKAction repeatActionForever:action];
        [girl runAction:repeater];
        
        //[self addChild:sprite];
    }
}

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}

@end
