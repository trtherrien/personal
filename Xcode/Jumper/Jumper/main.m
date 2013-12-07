//
//  main.m
//  Jumper
//
//  Created by Thomas Therrien on 9/24/13.
//  Copyright (c) 2013 Tom Therrien. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "TTAppDelegate.h"

int main(int argc, char * argv[])
{
    @autoreleasepool {
        @try {
            return UIApplicationMain(argc, argv, nil, NSStringFromClass([TTAppDelegate class]));
        }
        @catch (NSException *exception) {
            NSLog(exception.reason);
        }
        @finally {
            //
        }
    }
}
