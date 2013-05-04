//
//  XMLManager.m
//  XmlTest
//
//  Created by Thomas Therrien on 2/14/13.
//  Copyright (c) 2013 Thomas Therrien. All rights reserved.
//

#import "XMLManager.h"
#import "BasicXMLParser.h"

@implementation XMLManager
-(void) getDoc {
    NSURL* url = [[NSURL alloc] initWithString:@"https://10.64.129.12/cgi-bin/CGILink?cmd=validate&user=helpdesk&password=123"];
    NSXMLParser* parser = [[NSXMLParser alloc] initWithContentsOfURL:url];
    BasicXMLParser* basicParser = [[BasicXMLParser alloc]init];
    [parser setDelegate:basicParser];
    
    BOOL success = [parser parse];
    
    if(success) {
        NSLog(@"No Errors");
    }
    else { 
        NSLog(@"%@", parser.parserError);
    }
    
}
@end
