//
//  SpriteViewController.m
//  SpriteWalkThrough
//
//  Created by Thomas Therrien on 6/13/13.
//  Copyright (c) 2013 Tom Therrien. All rights reserved.
//

#import "SpriteViewController.h"
//Include header for scene
#import "SpriteHelloScene.h"

@interface SpriteViewController ()

@end

@implementation SpriteViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    //Must have an SKView (the storyboard view has to be changed to SKView as well
    SKView *spriteView = (SKView*) self.view;
    //Turn on the debugging
    spriteView.showsDrawCount = YES;
    spriteView.showsNodeCount = YES;
    spriteView.showsFPS = YES;
}

- (void) viewWillAppear:(BOOL)animated
{
    //Load the scene and put it in the view
    //Had to add SpriteHelloScene.h to Build Phases Compile Sources
    SKView *spriteView = (SKView*) self.view;
    SpriteHelloScene* hello = [SpriteHelloScene sceneWithSize:spriteView.bounds.size];
    [spriteView presentScene:hello];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
