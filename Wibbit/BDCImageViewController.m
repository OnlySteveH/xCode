//
//  BDCImageViewController.m
//  Wibbit
//
//  Created by Steve Hunter on 15/07/2014.
//  Copyright (c) 2014 Big Dog Consultants. All rights reserved.
//

#import "BDCImageViewController.h"

@interface BDCImageViewController ()

@end

@implementation BDCImageViewController



- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    PFFile *imageFile = [self.message objectForKey:@"file"];
    NSURL *imageFileUrl = [[NSURL alloc] initWithString:imageFile.url];
    NSData *imageData = [NSData dataWithContentsOfURL:imageFileUrl];
    self.imageView.image = [UIImage imageWithData:imageData];
    
    NSString *senderName = [self.message objectForKey:@"senderName"];
    self.navigationItem.title = [NSString stringWithFormat:@"Sent from %@", senderName];
}
- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    if([self respondsToSelector:@selector(timeout)]){
        
        [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(timeout) userInfo:nil repeats:NO];

    }
    else {
        NSLog(@"Error: selector missing!");
    }

}

-(void)timeout{
    [self.navigationController popViewControllerAnimated:YES];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
