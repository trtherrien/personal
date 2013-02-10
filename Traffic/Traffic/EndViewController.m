//
//  EndViewController.m
//  Traffic
//
//  Created by Thomas Therrien on 2/9/13.
//  Copyright (c) 2013 Thomas Therrien. All rights reserved.
//

#import "EndViewController.h"

@interface EndViewController ()

@end

@implementation EndViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    NSLog(@"End Seque loaded");
    [self performSelector:@selector(endGame:) withObject:nil afterDelay:1.5];
}

-(IBAction)endGame:(id)sender {
    //[self dismissViewControllerAnimated:NO completion:nil];
    //NSLog(@"Ending...");
    [self performSegueWithIdentifier:@"GOS" sender:self];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
