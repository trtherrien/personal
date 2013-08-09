//
//  ViewController.m
//  Tom's Yahtzee Score Pad
//
//  Created by Thomas Therrien on 7/13/13.
//  Copyright (c) 2013 Tom Therrien. All rights reserved.
//

#import "ViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface ViewController ()
@property (strong, nonatomic) IBOutletCollection(UILabel) NSArray *scores;
@property (weak, nonatomic) IBOutlet UILabel *oneLabel;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    _oneLabel.layer.borderWidth=1;
    for(UILabel *label in _scores)
    {
        label.layer.borderWidth = 1;
        label.layer.borderColor = [UIColor blackColor].CGColor;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
