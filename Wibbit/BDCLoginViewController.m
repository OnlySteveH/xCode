//
//  BDCLoginViewController.m
//  Wibbit
//
//  Created by Steve Hunter on 01/07/2014.
//  Copyright (c) 2014 Big Dog Consultants. All rights reserved.
//

#import "BDCLoginViewController.h"
#import <Parse/Parse.h>

@interface BDCLoginViewController ()

@end

@implementation BDCLoginViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //self.navigationItem.hidesBackButton = YES;
    if([UIScreen mainScreen].bounds.size.height == 568) {
        self.backgroundImageView.image = [UIImage imageNamed:@"loginBackground"];
    }

}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    [self.navigationController.navigationBar setHidden:YES];
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

- (IBAction)login:(id)sender {
        NSString *username = [self.usernameField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
        NSString *password = [self.passwordField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
        if([username length] == 0 || [password length] == 0){
                UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"Oops!"
                                                            message:@"Make sure you enter a username and password."
                                                            delegate:nil
                                                            cancelButtonTitle:@"OK"
                                                            otherButtonTitles:nil];
                    [alertView show];
                }
                else{
                    [PFUser logInWithUsernameInBackground:username password:password block:^(PFUser *user, NSError *error) {
                        if(error){
                            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Sorry!" message:[error.userInfo objectForKey:@"error"] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                            [alertView show];
                        }
                        else {
                            [self.navigationController popToRootViewControllerAnimated:YES];
                        }
                    }];
                }
}


@end
