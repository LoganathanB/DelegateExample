//
//  ViewController.m
//  DelegateExample
//
//  Created by Loganathan on 07/03/14.
//  Copyright (c) 2014 Loganathan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

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

#pragma mark - Outlet Action Methods
- (IBAction)appleTapped:(id)sender {
    Downloader *downloader = [[Downloader alloc] init];
    downloader.identifier = APPLE;
    downloader.delegate = self;
    [downloader downloadImageURL:[NSURL URLWithString:APPLE_URL]];
}

- (IBAction)orangeTapped:(id)sender {
    Downloader *downloader = [[Downloader alloc] init];
    downloader.identifier = ORANGE;
    downloader.delegate = self;
    [downloader downloadImageURL:[NSURL URLWithString:ORANGE_URL]];
}

#pragma mark - Downloader Delegate Methods

-(void)didFinishFailDownloader:(Downloader *)downloader WithError:(NSError *)error{
    if ([downloader.identifier isEqualToString:APPLE]) {
        NSLog(@"apple error = %@", error.description);
    } else if ([downloader.identifier isEqualToString:ORANGE]){
        NSLog(@"orange error = %@", error.description);
    }
}

-(void)didFinishSuccessfulDownloader:(Downloader *)downloader withData:(NSData *)data{
    UIImage *image = [UIImage imageWithData:data];
    if ([downloader.identifier isEqualToString:APPLE]) {
        dispatch_sync(dispatch_get_main_queue(), ^{
            [_imageView setImage:image];
        });
    } else if ([downloader.identifier isEqualToString:ORANGE]){
        dispatch_sync(dispatch_get_main_queue(), ^{
            [_imageView setImage:image];
        });
    }
}

@end
