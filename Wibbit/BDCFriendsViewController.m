//
//  BDCFriendsViewController.m
//  Wibbit
//
//  Created by Steve Hunter on 08/07/2014.
//  Copyright (c) 2014 Big Dog Consultants. All rights reserved.
//

#import "BDCFriendsViewController.h"
#import "BDCEditFriendsViewController.h"
#import "GravatarUrlBuilder.h"

@interface BDCFriendsViewController ()

@end

@implementation BDCFriendsViewController



- (void)viewDidLoad
{
    [super viewDidLoad];
    }

- (void)viewWillAppear:(BOOL)animated{
    
    
    [super viewWillAppear:animated];
    self.friendsRelation = [[PFUser currentUser] objectForKey:@"friendsRelation"];

    
    PFQuery *query = [self.friendsRelation query];
    [query orderByAscending:@"username"];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if(error){
            NSLog(@"%@, %@", error, [error userInfo]);
        }
        else{
            self.friends = objects;
            [self.tableView reloadData];
        }
    }];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"showEditFriends"]){
        BDCEditFriendsViewController *viewController = (BDCEditFriendsViewController *)segue.destinationViewController;
        viewController.friends = [NSMutableArray arrayWithArray:self.friends];
    }
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    return [self.friends count];
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    PFUser *user = [self.friends objectAtIndex:indexPath.row];
    cell.textLabel.text = user.username;
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(queue, ^{
        // get email
        NSString *email = [user objectForKey:@"email"];
        
        // create hash
        NSURL *gravatarUrl = [GravatarUrlBuilder getGravatarUrl:email];
        
        // request image
        NSData *imageData = [NSData dataWithContentsOfURL:gravatarUrl];
        if (imageData != nil) {
        dispatch_async(dispatch_get_main_queue(), ^{
            // set image in cell
            cell.imageView.image = [UIImage imageWithData:imageData];
            [cell setNeedsLayout];
          });
        // end if
        }
        cell.imageView.image = [UIImage imageNamed:@"icon_person"];
    
    });
    
    
    return cell;
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
