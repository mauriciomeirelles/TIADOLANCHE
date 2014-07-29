//
//  TDLViewController.m
//  TIADOLANCHE
//
//  Created by Mauricio Meirelles on 7/29/14.
//  Copyright (c) 2014 bepid. All rights reserved.
//

#import "TDLViewController.h"

@interface TDLViewController ()
@property (weak, nonatomic) IBOutlet UIButton *btSendYo;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *actvIndicator;

@end

@implementation TDLViewController


- (IBAction)sendYO:(id)sender {
    
    [_btSendYo setTitle:@"" forState:UIControlStateNormal];
    [_actvIndicator startAnimating];

    NSString *post = @"api_token=fc3ebc69-9a16-9072-f6f1-b2aa5f0506a7";
    NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
    
    NSString *postLength = [NSString stringWithFormat:@"%d", [postData length]];
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setURL:[NSURL URLWithString:@"http://api.justyo.co/yoall/"]];
    [request setHTTPMethod:@"POST"];
    [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
    [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    [request setHTTPBody:postData];
    
    NSURLConnection  *serverConnectionObj = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    [serverConnectionObj start];
    
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    [_actvIndicator stopAnimating];

    [_btSendYo setTitle:@"SENT YO!" forState:UIControlStateNormal];

    [self performSelector:@selector(changeBackLabel) withObject:nil afterDelay:3.0];
    
}

-(void)changeBackLabel
{
    [_btSendYo setTitle:@"TIADOLANCHE" forState:UIControlStateNormal];

}



- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

    self.view.backgroundColor = [UIColor colorWithRed:0.61 green:0.36 blue:0.71 alpha:1];
    
    _btSendYo.backgroundColor = [UIColor colorWithRed:0.22 green:0.8 blue:0.46 alpha:1];
    
}

@end
