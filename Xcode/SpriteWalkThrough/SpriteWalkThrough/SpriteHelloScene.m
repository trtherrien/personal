//
//  SpriteHelloScene.m
//  SpriteWalkThrough
//
//  Created by Thomas Therrien on 6/13/13.
//  Copyright (c) 2013 Tom Therrien. All rights reserved.
//

#import "SpriteHelloScene.h"
#import "SpriteSpaceshipScene.h"

@implementation SpriteHelloScene

-(void)didMoveToView:(SKView *)view
{
    if (!self.contentCreated)
    {
        [self createSceneContents];
        self.contentCreated = YES;
    }
}

-(void) createSceneContents
{
    self.backgroundColor = [SKColor blueColor];
    self.scaleMode =  SKSceneScaleModeAspectFit;
    [self addChild:[self newHelloNode]];
    [self addChild:[self newPressKeyNode]];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    SKNode *helloNode = [self childNodeWithName:@"helloNode"];
    if (helloNode != nil)
    {
        helloNode.name = nil;
        SKAction *moveUp = [SKAction moveByX:0 y:100.0 duration:0.5];
        SKAction *zoom = [SKAction scaleTo:2.0 duration:0.25];
        SKAction *pause = [SKAction waitForDuration:0.5];
        SKAction *fadeAway = [SKAction fadeOutWithDuration:0.25];
        SKAction *remove = [SKAction removeFromParent];
        SKAction *moveSequence = [SKAction sequence:@[moveUp, zoom, pause, fadeAway, remove]];
        [helloNode runAction:moveSequence];
    }
    
    SKNode *pressNode = [self childNodeWithName:@"pressNode"];
    if (pressNode != nil)
    {
        pressNode.name = nil;
        SKAction *rotate= [SKAction rotateToAngle:90 duration:0.5];
        SKAction *moveDown = [SKAction moveByX:0 y:-500 duration:1.0];
        SKAction *removePress = [SKAction removeFromParent];
        //SKAction *sound = [SKAction playSoundFileNamed:@"beep-1.mp3" waitForCompletion:NO];
        SKAction *pressSequence = [SKAction sequence:@[rotate, moveDown, removePress]];
        
        [pressNode runAction:pressSequence completion:^{
            SKScene* spaceshipScene = [[SpriteSpaceshipScene alloc] initWithSize:self.size];
            SKTransition *doors = [SKTransition doorsOpenVerticalWithDuration:0.5];
            [self.view presentScene:spaceshipScene transition:doors];
        }];
    }
    
}

-(SKLabelNode*) newHelloNode
{
    SKLabelNode *helloNode = [SKLabelNode labelNodeWithFontNamed:@"Chalkduster"];
    helloNode.text = @"Tom's Test Game";
    helloNode.fontSize = 24;
    helloNode.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame));
    helloNode.name = @"helloNode";
    return helloNode;
}

-(SKLabelNode*) newPressKeyNode
{
    SKLabelNode *pressNode = [SKLabelNode labelNodeWithFontNamed:@"Chalkduster"];
    pressNode.fontSize = 16;
    pressNode.text = @"Touch Screen To Continue";
    pressNode.name = @"pressNode";
    
    SKNode *helloNode = [self childNodeWithName:@"helloNode"];
    if (helloNode != nil)
    {
        pressNode.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMinY(helloNode.frame) - helloNode.frame.size.height - 10);
    }
    else
    {
        pressNode.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame));
    }
    return pressNode;
}

@end
