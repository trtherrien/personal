//
//  SpriteSpaceshipScene.m
//  SpriteWalkThrough
//
//  Created by Thomas Therrien on 6/15/13.
//  Copyright (c) 2013 Tom Therrien. All rights reserved.
//

#import "SpriteSpaceshipScene.h"

@implementation SpriteSpaceshipScene

static const uint32_t rockCategory     =  0x1 << 0;
static const uint32_t shipCategory        =  0x1 << 1;

-(id)initWithSize:(CGSize)size
{
    if (self = [super initWithSize:size])
    {
        self.physicsWorld.contactDelegate = self;
    }
    return self;
}

-(void) didMoveToView:(SKView*)view
{
    if (!self.contentCreated)
    {
        [self createSceneContents];
        self.contentCreated = YES;
    }
}

-(void)createSceneContents
{
    self.backgroundColor = [SKColor blackColor];
    self.scaleMode = SKSceneScaleModeAspectFit;
    SKSpriteNode *spaceship = [self newSpaceship];
    spaceship.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame)-150);
    [self addChild:spaceship];
    SKAction *makeRocks = [SKAction sequence: @[
                                                [SKAction performSelector:@selector(addRock) onTarget:self],
                                                [SKAction waitForDuration:0.10 withRange:0.15]
                                                ]];
    [self runAction: [SKAction repeatActionForever:makeRocks]];
}

-(SKSpriteNode *) newSpaceship
{
    SKTexture *rocketTexture = [SKTexture textureWithImageNamed:@"octo1.png"];
    SKTexture *rocketTexture2 = [SKTexture textureWithImageNamed:@"octo2.png"];
    SKSpriteNode *hull = [SKSpriteNode spriteNodeWithTexture:rocketTexture];
    //SKSpriteNode* hull = [SKSpriteNode spriteNodeWithImageNamed:@"ship.png"];
    //SKSpriteNode *hull = [[SKSpriteNode alloc] initWithColor:[SKColor grayColor] size:CGSizeMake(64,32)];
    CGSize test = hull.size;
    test.height -= 20;
    hull.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:test];
    //hull.physicsBody = [SKPhysicsBody bodyWithCircleOfRadius:hull.size.width/4];
    hull.physicsBody.dynamic = NO;
    hull.physicsBody.density = 0.5;
    hull.physicsBody.friction = 1.0;
    hull.physicsBody.categoryBitMask = shipCategory;
    hull.physicsBody.collisionBitMask = shipCategory | rockCategory;
    hull.physicsBody.contactTestBitMask = shipCategory | rockCategory;
    
    
    SKSpriteNode *light1 = [self newLight];
    light1.position = CGPointMake(-28.0, 6.0);
    [hull addChild:light1];
    
    SKSpriteNode *light2 = [self newLight];
    light2.position = CGPointMake(28.0, 6.0);
    [hull addChild:light2];
    
    SKAction *hover = [SKAction sequence:@[
                        [SKAction waitForDuration:1.0],
                        [SKAction moveByX:100 y:50.0 duration:1.0],
                        [SKAction waitForDuration:1.0],
                        [SKAction moveByX:-100 y:-50 duration:1.0]
                                           ]];
    [hull runAction: [SKAction repeatActionForever:hover]];
    SKAction *talk = [SKAction animateWithTextures:@[rocketTexture, rocketTexture2] timePerFrame:0.1];
    [hull runAction: [SKAction repeatActionForever:talk]];
    return hull;
}

- (SKSpriteNode *)newLight
{
    SKSpriteNode *light = [[SKSpriteNode alloc] initWithColor:[SKColor yellowColor] size:CGSizeMake(8,8)];
    
    SKAction *blink = [SKAction sequence:@[
                                           [SKAction fadeOutWithDuration:0.25],
                                           [SKAction fadeInWithDuration:0.25]]];
    SKAction *blinkForever = [SKAction repeatActionForever:blink];
    [light runAction: blinkForever];
    
    return light;
}
static inline CGFloat skRandf() {
    return rand() / (CGFloat) RAND_MAX;
}

static inline CGFloat skRand(CGFloat low, CGFloat high) {
    return skRandf() * (high - low) + low;
}

- (void) addRock
{
    SKSpriteNode *rock = [[SKSpriteNode alloc] initWithColor:[SKColor brownColor] size:CGSizeMake(8,8)];
    rock.position = CGPointMake(skRand(0, self.size.width), self.size.height-50);
    rock.name = @"rock";
    rock.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:rock.size];
    rock.physicsBody.friction = 1.0;
    rock.physicsBody.usesPreciseCollisionDetection = YES;
    rock.physicsBody.restitution = 0.0;
    rock.physicsBody.categoryBitMask = rockCategory;
    [self addChild:rock];
}

-(void)didSimulatePhysics
{
    [self enumerateChildNodesWithName:@"rock" usingBlock:^(SKNode *node, BOOL *stop) {
        if (node.position.y < 0)
            [node removeFromParent];
    }];
}

-(void)didBeginContact:(SKPhysicsContact *)contact
{
    if (contact.bodyA.categoryBitMask == rockCategory) {
        [contact.bodyA.node removeFromParent];
    } else if (contact.bodyB.categoryBitMask == rockCategory) {
         [contact.bodyB.node removeFromParent];
    }
}

@end
