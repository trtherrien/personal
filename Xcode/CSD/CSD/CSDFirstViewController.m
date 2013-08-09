//
//  CSDFirstViewController.m
//  CSD
//
//  Created by Thomas Therrien on 5/7/13.
//  Copyright (c) 2013 Valet Waste. All rights reserved.
//

#import "CSDFirstViewController.h"
#import "CSDLogin.h"

@interface CSDFirstViewController ()

@end

@implementation CSDFirstViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"First", @"First");
        self.tabBarItem.image = [UIImage imageNamed:@"first"];
    }
    return self;
}
							
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)TestButtonClick:(id)sender {
    NSString *soapMessage = @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
        "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
        "<soap:Body>\n"
        "<HelloWorld xmlns=\"http://tempuri.org/\" />\n"
        "</soap:Body>\n"
        "</soap:Envelope>\n";
    
    NSURL *url = [NSURL URLWithString:@"http://10.1.15.39/csd/services/test.asmx?op=HelloWorld?"];
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    //[theRequest addValue: @"http://tempuri.org/CelsiusToFahrenheit" forHTTPHeaderField:@"SOAPAction"];
    [theRequest addValue: msgLength forHTTPHeaderField:@"Content-Length"];
    
    [theRequest setHTTPMethod:@"POST"];
    [theRequest setHTTPBody: [soapMessage dataUsingEncoding:NSUTF8StringEncoding]];
    
    NSURLConnection *theConnection = [[NSURLConnection alloc] initWithRequest:theRequest delegate:self];
    
    if( theConnection )
    {
        NSLog(@"Connect");
    }
    else
    {
        NSLog(@"theConnection is NULL");
    }
    
    //NSLog(@"This is a test");
    //CSDLogin *login = [[CSDLogin alloc]init];
    //[login LoginAsUser:@"ttherrien@valetwaste.com" Password:@"Tampa15"];
}
- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    NSLog(@"Finished Loading");
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    NSString *myString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    NSLog(myString);
}
@end
