//
//  TTMyScene.h
//  Jumper
//

//  Copyright (c) 2013 Tom Therrien. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "TTQuestion.h"

@interface TTMyScene : SKScene {
    SKSpriteNode* stickMan;
    BOOL jumping;
    BOOL dragging;
    TTQuestion* question;
    SKLabelNode *topNumberLabel;
    SKLabelNode *bottomNumberLabel;
    SKLabelNode *questionTypeLabel;
    SKLabelNode *answer1;
    SKLabelNode *answer2;
    SKLabelNode *answer3;
    SKSpriteNode* redBalloon;
    SKSpriteNode* greenBalloon;
    SKSpriteNode* purpleBalloon;
    SKLabelNode *results;
    int compensation;
    BOOL waiting;
}
@end
