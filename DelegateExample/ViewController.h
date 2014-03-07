//
//  ViewController.h
//  DelegateExample
//
//  Created by Loganathan on 07/03/14.
//  Copyright (c) 2014 Loganathan. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "Downloader.h"

NSString *APPLE_URL = @"http://upload.wikimedia.org/wikipedia/commons/thumb/1/15/Red_Apple.jpg/661px-Red_Apple.jpg";
NSString *ORANGE_URL = @"http://www.dailyfruit.de/images/product_images/original_images/orange.jpg";
NSString *APPLE = @"apple";
NSString *ORANGE = @"orange";


@interface ViewController : UIViewController<DownloaderDelegate>
- (IBAction)appleTapped:(id)sender;
- (IBAction)orangeTapped:(id)sender;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end
