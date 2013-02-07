//
//  DataViewController.m
//  Traffic
//
//  Created by Thomas Therrien on 2/1/13.
//  Copyright (c) 2013 Thomas Therrien. All rights reserved.
//

#import "MainMenuViewController.h"

@interface MainMenuViewController ()

@end

@implementation MainMenuViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    popAnimation = [CAKeyframeAnimation animationWithKeyPath:@"tansform.scale"];
    popAnimation.keyTimes = [NSArray arrayWithObjects:[NSNumber numberWithFloat:0.0], [NSNumber numberWithFloat:0.7], [NSNumber numberWithFloat:1.0], nil];
}

- (void) popView: (UIView*) view
{
    [view setHidden:NO];
    [[view layer] addAnimation:popAnimation forKey:@"transform.scale"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [popAnimation setDuration:0.3];
    [self.gameButton setHidden:YES];
    [self.statButton setHidden:YES];
    [self.gameSettingsButton setHidden:YES];
    [self performSelector:@selector(popView:) withObject:self.gameButton afterDelay:0.25];
    [self performSelector:@selector(popView:) withObject:self.statButton afterDelay:0.3];
    [self performSelector:@selector(popView:) withObject:self.gameSettingsButton afterDelay:0.35];
}
@end
