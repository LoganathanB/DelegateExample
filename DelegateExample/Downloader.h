//
//  Downloader.h
//  DelegateExample
//
//  Created by Loganathan on 07/03/14.
//  Copyright (c) 2014 Loganathan. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol DownloaderDelegate;


@interface Downloader : NSObject

@property (nonatomic, retain) id<DownloaderDelegate> delegate;
@property (nonatomic, retain) NSString *identifier;

-(void) downloadImageURL:(NSURL *)url;

@end

@protocol DownloaderDelegate <NSObject>

-(void)didFinishSuccessfulDownloader:(Downloader *)downloader withData:(NSData *)data;

@optional

-(void)didFinishFailDownloader:(Downloader *)downloader WithError:(NSError *)error;

@end