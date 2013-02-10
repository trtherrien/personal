//
//  TrafficViewController.m
//  Traffic
//
//  Created by Thomas Therrien on 2/1/13.
//  Copyright (c) 2013 Thomas Therrien. All rights reserved.
//

#import "TrafficViewController.h"
#import "Vehicle.h"
#import "TrafficController.h"
@class EndViewController;
@interface TrafficViewController ()

@end

@implementation TrafficViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void) viewWillAppear:(BOOL)animated
{
    [_gameController startGame];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    NSLog(@"Testing git");
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) setTimeRemaining:(CGFloat)time {
    self.timeRemainingLabel.text = [NSString stringWithFormat:@"%.1f",time];
}

-(IBAction)pauseGame:(id)sender {
    [self.gameController togglePause];
}

-(IBAction)returned:(UIStoryboardSegue *)segue {
    [self.gameController togglePause];
}

-(void)displayGameOver {
    NSLog(@"Game Over");
    [self performSegueWithIdentifier:@"EndSegue2" sender:self];
}

@end
