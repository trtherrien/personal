//
//  MTMemoryTile.h
//  Memory
//
//  Created by Thomas Therrien on 2/23/13.
//  Copyright (c) 2013 Thomas Therrien. All rights reserved.
//

#import "CCLayer.h"
#import "cocos2d.h"
#import "SimpleAudioEngine.h"

@interface MTMemoryTile : CCSprite 

@property (nonatomic, assign) NSInteger tileRow;
@property (nonatomic, assign) NSInteger tileColumn;
@property (nonatomic, assign) BOOL isFaceUp;
@property (nonatomic, retain) NSString* faceSpriteName;

-(void) showFace;
-(void)showBack;
-(void) flipTile;
-(BOOL) containsToachLocation: (CGPoint)pos;


@end
