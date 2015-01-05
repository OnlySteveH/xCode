//
//  BDCSignupViewController.h
//  Wibbit
//
//  Created by Steve Hunter on 01/07/2014.
//  Copyright (c) 2014 Big Dog Consultants. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BDCSignupViewController : UIViewController <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *usernameField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;
@property (weak, nonatomic) IBOutlet UITextField *emailField;

@property (weak, nonatomic) IBOutlet UIImageView *backgroundImageView;
- (IBAction)signup:(id)sender;
- (IBAction)dismiss:(id)sender;

@end
