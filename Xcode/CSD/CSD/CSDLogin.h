//
//  CSDLogin.h
//  CSD
//
//  Created by Thomas Therrien on 5/8/13.
//  Copyright (c) 2013 Valet Waste. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CSDLogin : NSObject <NSURLConnectionDelegate>
@property NSString *userName;
@property NSString *password;
-(Boolean) LoginAsUser:(NSString *)userName Password:(NSString*)password;
@end
