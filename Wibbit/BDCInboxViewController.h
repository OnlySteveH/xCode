//
//  BDCInboxViewController.h
//  Wibbit
//
//  Created by Steve Hunter on 01/07/2014.
//  Copyright (c) 2014 Big Dog Consultants. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import <MediaPlayer/MediaPlayer.h>

@interface BDCInboxViewController : UITableViewController

@property (nonatomic, strong) NSArray *messages;
@property (nonatomic, strong) PFObject *selectedMessage;
@property (nonatomic, strong) MPMoviePlayerController *moviePlayer;


- (IBAction)logout:(id)sender;


@end
