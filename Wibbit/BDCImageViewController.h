//
//  BDCImageViewController.h
//  Wibbit
//
//  Created by Steve Hunter on 15/07/2014.
//  Copyright (c) 2014 Big Dog Consultants. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface BDCImageViewController : UIViewController

@property(nonatomic, strong) PFObject *message;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end
