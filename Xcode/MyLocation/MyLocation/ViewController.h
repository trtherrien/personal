//
//  ViewController.h
//  MyLocation
//
//  Created by Thomas Therrien on 8/25/13.
//  Copyright (c) 2013 Tom Therrien. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface ViewController : UIViewController <CLLocationManagerDelegate>
@property (nonatomic, retain) CLLocationManager* locationManager;
@property (nonatomic, retain) CLLocation *lastLocation;

- (IBAction)getNewLocation:(id)sender;
@end
