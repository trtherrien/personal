//
//  CSDAppDelegate.m
//  TimeTracker
//
//  Created by Thomas Therrien on 6/4/13.
//  Copyright (c) 2013 Tom Therrien. All rights reserved.
//

#import "CSDAppDelegate.h"

@implementation CSDAppDelegate
MYSQL mysql;    // MYSQL global
MYSQL * conn ;  // represents connection to database

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
    mysql_init(&mysql);
    conn = mysql_real_connect(&mysql, "localhost", "root", "", "timeTracker", 0, 0, 0);
    if (!conn)  {
        NSLog(@"Could Not Connect");
        NSLog(@"Error: %s\n", mysql_error( &mysql ) ) ;
        exit(EXIT_FAILURE);
    } else {
        NSLog(@"Connected");
    }
    mysql_close(conn);
}

@end
