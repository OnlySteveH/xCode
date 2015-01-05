//
//  BDCEditFriendsViewController.h
//  Wibbit
//
//  Created by Steve Hunter on 07/07/2014.
//  Copyright (c) 2014 Big Dog Consultants. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface BDCEditFriendsViewController : UITableViewController

@property (nonatomic, strong) NSArray *allUsers;
@property (nonatomic, strong) PFUser *currentUser;
@property (nonatomic, strong) NSMutableArray *friends;

- (BOOL)isFriend:(PFUser *)user;

@end
