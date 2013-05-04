//
//  PlayfieldLayer.m
//  Memory
//
//  Created by Thomas Therrien on 2/17/13.
//  Copyright (c) 2013 Thomas Therrien. All rights reserved.
//

#import "MTPlayfieldLayer.h"

#define SND_TILE_FLIP @"button.caf"
#define SND_TILE_SCORE @"whoosh.caf"
#define SND_TILE_WRONG @"buzzer.caf"
#define NSD_SCORE @"harprun.caf"

@implementation MTPlayfieldLayer

+(id) layerWithRows:(NSInteger)numRows
         andColumns:(NSInteger)numCols {
    return [[[self alloc]initWithRows:numRows
                            andColums:numCols]autorelease];
    
}
-(id) initWithRows:(NSInteger)numRows
        andColumns:(NSInteger)numCols {
    if (self == [super init]) {
        self.isTouchEnabled = YES;
        size = [[CCDirector sharedDirector]winSize];
        [self preloadEffects];
        [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"memorysheet.plist"];
        memorySheet = [CCSpriteBatchNode batchNodeWithFile:@"memorysheet.png"];
        [self addChild:memorySheet];
        backButton = [CCSprite spriteWithSpriteFrameName:@"backbutton.png"];
        [backButton setAnchorPoint:ccp(1,0)];
        [backButton setPosition:ccp(size.width - 10, 10)];
        [memorySheet addChild:backButton];
        boardWidth = 400;
        boardHeight = 320;
        boardRows = numRows;
        boardColumns = numCols;
        
        //Disallow impossible board
        if ((boardRows * boardColumns) % 2) {
            boardRows--;
        }
        
        
        maxTiles = (boardRows * boardColumns) / 2;
        padHeight = 10;
        padWidth = 10;
        float tileWidth = ((boardWidth-(boardColumns * padWidth))/boardColumns) - padWidth;
        float tileHeight = ((boardHeight-(boardRows * padHeight))/boardRows) - padHeight;
        
        if (tileWidth > tileHeight ) {
            tileWidth = tileHeight;
        } else {
            tileHeight = tileWidth;
        }
        
        tileSize = CGSizeMake(tileWidth, tileHeight);
        boardOffsetX = (boardWidth - ((tileSize.width + padWidth) * boardColumns)) / 2;
        boardOffsetY = (boardHeight- ((tileSize.height + padHeight) * boardRows)) / 2;
        playerScore = 0;
        [self acquireMemoryTiles];
        [self generateTileGrid];
        [self calculateLivesRemaining];
        [self generateScoreAndLivesDisplay];
    }
    return self;
}

-(void) acquireMemoryTiles {
    for (int cnt = 1; cnt <= maxTiles; cnt++) {
        for (NSInteger tileNo = 1; tileNo <= 2; tileNo++) {
            NSString* imageName = [NSString stringWithFormat:@:"tile%1.png", cnt];
            MTMemoryTile* newTile = [MTMemoryTile spriteWithSpriteFrameName:imageName];
            [newTile setFaceSpriteName:imageName];
            [newTile showBack];
            [tilesAvailable addObject:newTile];
        }
    }
}



@end
