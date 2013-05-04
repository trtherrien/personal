//
//  BasicXMLParser.m
//  XmlTest
//
//  Created by Thomas Therrien on 2/14/13.
//  Copyright (c) 2013 Thomas Therrien. All rights reserved.
//

#import "BasicXMLParser.h"

@implementation BasicXMLParser
- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict  {
    NSLog(@"%@",elementName);
}

@end
