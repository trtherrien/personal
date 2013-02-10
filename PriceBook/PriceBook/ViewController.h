//
//  ViewController.h
//  PriceBook
//
//  Created by Thomas Therrien on 2/10/13.
//  Copyright (c) 2013 Thomas Therrien. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZBarSDK.h"

@interface ViewController : UIViewController <ZBarReaderDelegate>
- (IBAction)scanPressed:(id)sender;

@end
