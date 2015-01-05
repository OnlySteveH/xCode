//
//  BDCFriendsViewController.m
//  Wibbit
//
//  Created by Steve Hunter on 08/07/2014.
//  Copyright (c) 2014 Big Dog Consultants. All rights reserved.
//

#import "BDCFriendsViewController.h"
#import "BDCEditFriendsViewController.h"

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
