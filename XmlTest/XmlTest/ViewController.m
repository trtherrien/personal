//
//  ViewController.m
//  XmlTest
//
//  Created by Thomas Therrien on 2/14/13.
//  Copyright (c) 2013 Thomas Therrien. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    XMLManager* xmlm = [[XMLManager alloc] init];
    NSLog(@"Get doc");
    [xmlm getDoc];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
