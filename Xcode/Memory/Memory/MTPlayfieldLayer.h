//
//  PlayfieldLayer.h
//  Memory
//
//  Created by Thomas Therrien on 2/17/13.
//  Copyright (c) 2013 Thomas Therrien. All rights reserved.
//

#import "CCLayer.h"
#import "cocos2d.h"
#import "MTMemoryTile.h"
#import "SimpleAudioEngine.h"
#import "MTMenuScene.h"

@interface MTPlayfieldLayer : CCLayer {
    CGSize size;
    CCSpriteBatchNode* memorySheet;
    CGSize tileSize;
    
    NSMutableArray* tilesAvailable;
    NSMutableArray* tilesInPlay;
    NSMutableArray* tilesSelected;
    
    CCSprite* backButton;
    
    NSInteger maxTiles;
    float boardWidth;
    float boardHeight;
    NSInteger boardRows;
    NSInteger boardColumns;
    NSInteger boardOffsetX;
    NSInteger boardOffsetY;
    NSInteger padWidth;
    NSInteger padHeight;
    NSInteger playerScore;
    CCLabelTTF* playerScoreDisplay;
    NSInteger livesRemaining;
    CCLabelTTF* livesRemainingDisplay;
    BOOL isGameOver;
}
+(id)layerWithRows:(NSInteger)numRows
        andColumns:(NSInteger)numCols;

@end
