//
//  Downloader.m
//  DelegateExample
//
//  Created by Loganathan on 07/03/14.
//  Copyright (c) 2014 Loganathan. All rights reserved.
//

#import "Downloader.h"

@implementation Downloader

-(void)downloadImageURL:(NSURL *)url{
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask = [session dataTaskWithURL:url completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        if (error) {
            if ([self.delegate respondsToSelector:@selector(didFinishFailDownloader:WithError:)]) {
                [self.delegate didFinishFailDownloader:self WithError:error];
            }
        } else {
            [self.delegate didFinishSuccessfulDownloader:self withData:data];
        }
    }];
    [dataTask resume];
}

@end
