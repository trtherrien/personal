//
//  ViewController.m
//  MyLocation
//
//  Created by Thomas Therrien on 8/25/13.
//  Copyright (c) 2013 Tom Therrien. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *locationLabel;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activity;

@end

@implementation ViewController

- (IBAction)buttonClick:(id)sender {
    [self.activity startAnimating];
    [self getNewLocation: self];
}

- (void)viewDidLoad
{
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.locationManager = [[CLLocationManager alloc]init];
    self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    self.locationManager.delegate = self;
}

- (void) locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation {
    
    self.locationLabel.text = [NSString stringWithFormat:@"Location: %f, %f", newLocation.coordinate.latitude, newLocation.coordinate.longitude];
    [self.locationManager stopUpdatingLocation];
    [self.activity stopAnimating];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) getNewLocation:(id)sender {
    [self.locationManager startUpdatingLocation];
}

@end
