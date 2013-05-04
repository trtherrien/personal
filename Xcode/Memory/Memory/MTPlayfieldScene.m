//
//  MTPlayfieldScene.m
//  Memory
//
//  Created by Thomas Therrien on 2/17/13.
//  Copyright (c) 2013 Thomas Therrien. All rights reserved.
//

#import "MTPlayfieldScene.h"

@implementation MTPlayfieldScene
+(id) sceneWithRows:(NSInteger) numRows
         andColumns:(NSInteger) numCols {
    return [[[self alloc] sceneWithRows:numRows andColumns:numCols] autorelease];
    
}
-(id) sceneWithRows:(NSInteger)numRows
         andColumns:(NSInteger) numCols {
    if ((self = [super init])) {
        MTPlayfieldLayer* layer = [MTPlayfieldLayer layerWithRows:numRows andColumns:numCols];
        [self addChild:layer];
    }
    return self;
}
@end
