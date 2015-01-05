//
//  BDCFriendsViewController.h
//  Wibbit
//
//  Created by Steve Hunter on 08/07/2014.
//  Copyright (c) 2014 Big Dog Consultants. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface BDCFriendsViewController : UITableViewController

@property (nonatomic, strong) PFRelation *friendsRelation;
@property (nonatomic,strong) NSArray *friends;


@end
