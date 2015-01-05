//
//  BDCCameraViewController.h
//  Wibbit
//
//  Created by Steve Hunter on 10/07/2014.
//  Copyright (c) 2014 Big Dog Consultants. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface BDCCameraViewController : UITableViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate>


@property(nonatomic, strong) UIImagePickerController *imagePicker;
@property(nonatomic, strong) UIImage *image;
@property(nonatomic, strong) NSArray *friends;
@property(nonatomic, strong) PFRelation *friendsRelation;
@property(nonatomic, strong) NSMutableArray *recipients;
@property(nonatomic, strong) NSString *videoFilePath;

- (IBAction)cancel:(id)sender;
- (IBAction)send:(id)sender;
- (void) uploadMessage;
- (UIImage *) resizeImage:(UIImage *)image toWidth:(float)width andHeight:(float)height;

@end
