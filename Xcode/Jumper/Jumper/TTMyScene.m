//
//  TTMyScene.m
//  Jumper
//
//  Created by Thomas Therrien on 9/24/13.
//  Copyright (c) 2013 Tom Therrien. All rights reserved.
//

#import "TTMyScene.h"

@implementation TTMyScene

-(id)initWithSize:(CGSize)size {    
    if (self = [super initWithSize:size]) {
        /* Setup your scene here */
        self.backgroundColor = [SKColor colorWithRed:0.25 green:0.50 blue:0.0 alpha:1.0];
        [self addBackground];
        [self addStickMan];
        question = [[TTQuestion alloc]init];
        [question generateQuestion:QUESTION_ADD];
        topNumberLabel = [SKLabelNode labelNodeWithFontNamed:@"Chalkduster"];
        topNumberLabel.position = CGPointMake(CGRectGetMidX(self.frame), 200+ compensation);
        topNumberLabel.text = @"0";
        bottomNumberLabel = [SKLabelNode labelNodeWithFontNamed:@"Chalkduster"];
        //topNumberLabel.horizontalAlignmentMode = SKLabelHorizontalAlignmentModeRight;
        bottomNumberLabel.position = CGPointMake(CGRectGetMidX(self.frame),150+ compensation);
        bottomNumberLabel.text = @"0";
        questionTypeLabel = [SKLabelNode labelNodeWithFontNamed:@"Chalkduster"];
        //bottomNumberLabel.horizontalAlignmentMode = SKLabelHorizontalAlignmentModeRight;
        questionTypeLabel.position = CGPointMake(CGRectGetMidX(self.frame) - 60,150+ compensation);
        questionTypeLabel.text = @"+";
        
        
        answer1 = [SKLabelNode labelNodeWithFontNamed:@"Chalkduster"];
        answer2 = [SKLabelNode labelNodeWithFontNamed:@"Chalkduster"];
        answer3 = [SKLabelNode labelNodeWithFontNamed:@"Chalkduster"];
        
        results = [SKLabelNode labelNodeWithFontNamed:@"Chalkduster"];
        results.fontColor = [UIColor yellowColor];
        results.text = @"";
        results.position = CGPointMake(CGRectGetMidX(self.frame), 240 + compensation);
        
        answer1.text = @"0";
        answer2.text = @"0";
        answer3.text = @"0";
        
        answer1.position = CGPointMake(55, 400 + compensation);
        answer2.position = CGPointMake(155, 400 + compensation);
        answer3.position = CGPointMake(255, 400 + compensation);
        
        [self addChild:topNumberLabel];
        [self addChild:bottomNumberLabel];
        [self addChild:questionTypeLabel];
        [self addLine];
        [self addBalloons];
        [self addChild:answer1];
        [self addChild:answer2];
        [self addChild:answer3];
        [self addChild:results];
        
    }
    return self;
}

-(void) addBalloons {
    redBalloon = [SKSpriteNode spriteNodeWithImageNamed:@"Red-Balloon"];
    redBalloon.position = CGPointMake(50, 400 + compensation);
    greenBalloon = [SKSpriteNode spriteNodeWithImageNamed:@"Green-Balloon"];
    greenBalloon.position = CGPointMake(150, 400+ compensation);
    purpleBalloon = [SKSpriteNode spriteNodeWithImageNamed:@"Purple-Balloon"];
    purpleBalloon.position = CGPointMake(250, 400+ compensation);
    [self addChild:redBalloon];
    [self addChild:greenBalloon];
    [self addChild:purpleBalloon];
}

-(void) addBackground {
    SKSpriteNode* background = [SKSpriteNode spriteNodeWithImageNamed:@"background"];
    compensation = self.frame.size.height - (background.size.height + 20);
    //background.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame) - 20);
    background.anchorPoint = CGPointMake(0, 0);
    background.position = CGPointMake(0, compensation);
    [self addChild:background];
}

-(void) addLine {
    SKSpriteNode* line = [SKSpriteNode spriteNodeWithImageNamed:@"line"];
    line.position = CGPointMake(CGRectGetMidX(self.frame), 130+ compensation);
    [self addChild:line];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    /* Called when a touch begins */
    if (!waiting) {
        for (UITouch *touch in touches) {
            CGPoint positionInScene = [touch locationInNode:self];
            SKSpriteNode *touchedNode = (SKSpriteNode *)[self nodeAtPoint:positionInScene];
            
            if (![touchedNode.name  isEqual: @"figure"]) {
                [self jump];
            } else {
                dragging = YES;
            }
        }
    }
}

-(void) jump {
    if (jumping == NO) {
        jumping = YES;
        SKTextureAtlas* atlas = [SKTextureAtlas atlasNamed:@"jump"];
        SKTexture* jumpTexture1 = [atlas textureNamed:@"figure_move1.png"];
        SKTexture* jumpTexture2 = [atlas textureNamed:@"figure_move2.png"];
        SKTexture* jumpTexture3 = [atlas textureNamed:@"figure_move3.png"];
        SKAction* resetTexture = [SKAction setTexture: [ SKTexture textureWithImageNamed:@"figure.png"]];
        
        SKAction* jumpUp = [SKAction moveByX:0 y:25 duration:0.1];
        SKAction* changeImage1 = [SKAction setTexture:jumpTexture1];
        SKAction* changeImage2 = [SKAction setTexture:jumpTexture2];
        SKAction* changeImage3 = [SKAction setTexture:jumpTexture3];
        SKAction* jumpDown = [SKAction moveByX:0 y:-25 duration:0.1];
        
        SKAction* done = [SKAction performSelector:@selector(jumpDone) onTarget:self];
        
        SKAction* actions = [SKAction sequence:@[changeImage1, jumpUp, changeImage2, jumpUp, changeImage3, jumpUp, changeImage2, jumpDown, changeImage1, jumpDown, resetTexture, jumpDown, done]];
        [stickMan runAction:actions];
    }
}

-(void) touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    if (dragging) {
        UITouch *touch = [touches anyObject];
        stickMan.position = CGPointMake([touch locationInNode:self].x, stickMan.position.y);
    }
}

-(void) touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    dragging = NO;
    if (!waiting) {
        //This works because we are not doing multi-touch
        UITouch *touch = [touches anyObject];
        if ([touch locationInNode:self].x == [touch previousLocationInNode:self].x && [touch locationInNode:self].y == [touch previousLocationInNode:self].y) {
            [self jump];
        }
    }
}

-(void) jumpDone {
    jumping = NO;
}

-(void) addStickMan {
    stickMan = [SKSpriteNode spriteNodeWithImageNamed:@"figure"];
    stickMan.position = CGPointMake(100.0f, 315.0f + compensation);
    stickMan.name = @"figure";
    [self addChild:stickMan];
}

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
    int top = question.topNumber;
    int bottom = question.bottomNumber;
    topNumberLabel.text =  [NSString stringWithFormat: @"%i", top];
    bottomNumberLabel.text =  [NSString stringWithFormat: @"%i", bottom];
    
    switch (question.qType) {
        case QUESTION_ADD:
            questionTypeLabel.text = @"+";
            break;
        case QUESTION_DIV:
            questionTypeLabel.text = @"/";
            break;
        case QUESTION_MUL:
            questionTypeLabel.text = @"X";
            break;
        case QUESTION_SUB:
            questionTypeLabel.text = @"-";
        default:
            break;
    }
    
    if (question.correctLocation == 1) {
        answer1.text = [NSString stringWithFormat: @"%i", question.answer];
        answer2.text = [NSString stringWithFormat: @"%i", question.wrongAnswer1];
        answer3.text = [NSString stringWithFormat: @"%i", question.wrongAnswer2];
    } else if (question.correctLocation == 2) {
        answer2.text = [NSString stringWithFormat: @"%i", question.answer];
        answer1.text = [NSString stringWithFormat: @"%i", question.wrongAnswer1];
        answer3.text = [NSString stringWithFormat: @"%i", question.wrongAnswer2];
    } else {
        answer3.text = [NSString stringWithFormat: @"%i", question.answer];
        answer2.text = [NSString stringWithFormat: @"%i", question.wrongAnswer1];
        answer1.text = [NSString stringWithFormat: @"%i", question.wrongAnswer2];
    }
    
    
    UIColor * redColor = [UIColor colorWithRed:1.0 green:0.0 blue:0.0 alpha:1.0];
    UIGraphicsBeginImageContext(CGSizeMake(200, 20));
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextSetRGBStrokeColor(ctx, 1.0, 1.0, 0.0, 1.0);
    CGContextAddRect(ctx,
                     CGRectMake(50, 50, 200, 20));
    CGContextSetFillColorWithColor(ctx, redColor.CGColor);
    //CGContextFillRect(ctx, self.bounds);
    UIGraphicsEndImageContext();
    
    if (!waiting) {
        SKAction* restartAction = [SKAction performSelector:@selector(restart) onTarget:self];
        SKAction* winAction = [SKAction performSelector:@selector(restartWin) onTarget:self];
        SKAction* waiter = [SKAction waitForDuration:0.25];
        if ([stickMan intersectsNode:answer1]) {
            if (question.correctLocation == 1) {
                SKAction* popTexture = [SKAction setTexture: [ SKTexture textureWithImageNamed:@"Red-Balloon-Pop.png"]];
                SKAction* actions = [SKAction sequence:@[popTexture,waiter, winAction]];
                [redBalloon runAction:actions];
                results.alpha = 0.0;
                results.text = @"Good Job";
                SKAction* fadeIn = [SKAction fadeInWithDuration:0.50];
                [results runAction:fadeIn];
            } else {
                SKAction* moveLeft = [SKAction moveByX:-2 y:0 duration:0.1];
                SKAction* moveRight= [SKAction moveByX:+2 y:0 duration:0.1];
                SKAction* actions = [SKAction sequence:@[moveLeft, moveRight, moveRight, moveLeft, moveLeft,moveRight, moveRight, moveLeft, moveLeft, moveRight, restartAction]];
                [redBalloon runAction:actions];
                [answer1 runAction:actions];
                results.alpha = 0.0;
                results.text = @"Try Again";
                SKAction* fadeIn = [SKAction fadeInWithDuration:0.25];
                [results runAction:fadeIn];
            }
            waiting = YES;
        } else if ([stickMan intersectsNode:answer2]) {
            if (question.correctLocation == 2) {
                SKAction* popTexture = [SKAction setTexture: [ SKTexture textureWithImageNamed:@"Green-Balloon-Pop.png"]];
                SKAction* actions = [SKAction sequence:@[popTexture,waiter, winAction]];
                [greenBalloon runAction:actions];
                results.alpha = 0.0;
                results.text = @"Good Job";
                SKAction* fadeIn = [SKAction fadeInWithDuration:0.25];
                [results runAction:fadeIn];
            } else {
                SKAction* moveLeft = [SKAction moveByX:-2 y:0 duration:0.1];
                SKAction* moveRight= [SKAction moveByX:+2 y:0 duration:0.1];
                SKAction* actions = [SKAction sequence:@[moveLeft, moveRight, moveRight, moveLeft, moveLeft,moveRight, moveRight, moveLeft, moveLeft, moveRight, restartAction]];
                [greenBalloon runAction:actions];
                [answer2 runAction:actions];
                results.alpha = 0.0;
                results.text = @"Try Again";
                SKAction* fadeIn = [SKAction fadeInWithDuration:0.25];
                [results runAction:fadeIn];
            }
            waiting = YES;
        } else if ([stickMan intersectsNode:answer3]) {
            if (question.correctLocation == 3) {
                SKAction* popTexture = [SKAction setTexture: [ SKTexture textureWithImageNamed:@"Purple-Balloon-Pop.png"]];
                SKAction* actions = [SKAction sequence:@[popTexture,waiter, winAction]];
                [purpleBalloon runAction:actions];
                results.alpha = 0.0;
                results.text = @"Good Job";
                SKAction* fadeIn = [SKAction fadeInWithDuration:0.25];
                [results runAction:fadeIn];
            } else {
                SKAction* moveLeft = [SKAction moveByX:-2 y:0 duration:0.1];
                SKAction* moveRight= [SKAction moveByX:+2 y:0 duration:0.1];
                SKAction* actions = [SKAction sequence:@[moveLeft, moveRight, moveRight, moveLeft, moveLeft,moveRight, moveRight, moveLeft, moveLeft, moveRight, restartAction]];
                [purpleBalloon runAction:actions];
                [answer3 runAction:actions];
                results.alpha = 0.0;
                results.text = @"Try Again";
                SKAction* fadeIn = [SKAction fadeInWithDuration:0.25];
                [results runAction:fadeIn];
            }
            waiting = YES;
        }
    }
    
}

-(void) restart{
    waiting = NO;
    SKAction* fadeOut = [SKAction fadeOutWithDuration:0.25];
    [results runAction:fadeOut];
    SKAction* popTexture = [SKAction setTexture: [ SKTexture textureWithImageNamed:@"Purple-Balloon.png"]];
    [purpleBalloon runAction:popTexture];
    popTexture = [SKAction setTexture: [ SKTexture textureWithImageNamed:@"Red-Balloon.png"]];
    [redBalloon runAction:popTexture];
    popTexture = [SKAction setTexture: [ SKTexture textureWithImageNamed:@"Green-Balloon.png"]];
    [greenBalloon runAction:popTexture];
}

-(void) restartWin{
    sleep(1);
    int qType = (arc4random()%4);
    [question generateQuestion:qType];
    waiting = NO;
    SKAction* fadeOut = [SKAction fadeOutWithDuration:0.50];
    [results runAction:fadeOut];
    SKAction* popTexture = [SKAction setTexture: [ SKTexture textureWithImageNamed:@"Purple-Balloon.png"]];
    [purpleBalloon runAction:popTexture];
    popTexture = [SKAction setTexture: [ SKTexture textureWithImageNamed:@"Red-Balloon.png"]];
    [redBalloon runAction:popTexture];
    popTexture = [SKAction setTexture: [ SKTexture textureWithImageNamed:@"Green-Balloon.png"]];
    [greenBalloon runAction:popTexture];
}

@end
