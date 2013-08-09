//
//  CSDLogin.m
//  CSD
//
//  Created by Thomas Therrien on 5/8/13.
//  Copyright (c) 2013 Valet Waste. All rights reserved.
//

#import "CSDLogin.h"

@implementation CSDLogin
{
    NSMutableData* receivedData;
}

-(Boolean) LoginAsUser:(NSString *)userName Password:(NSString*)password {
    self.userName = userName;
    self.password = password;
    return self.Login;
}

-(Boolean) Login {
    NSLog(@"Login");
    NSURLRequest* loginRequest = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://10.1.15.39/csd/auth/logon.aspx"] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:60.0];
    
    NSLog(@"Make connection");
    NSURLConnection *theConnection=[[NSURLConnection alloc] initWithRequest:loginRequest delegate:self];
    
    if (theConnection) {
        NSLog(@"Connection Made");
        // Create the NSMutableData to hold the received data.
        // receivedData is an instance variable declared elsewhere.
        return YES;
    } else {
        // Inform the user that the connection failed.
        NSLog(@"Connection Failed");
        return NO;
    }
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    NSLog(@"Finished Loading");
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    NSString *myString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    NSLog(myString);
}

@end
