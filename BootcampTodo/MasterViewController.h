//
//  MasterViewController.h
//  BootcampTodo
//
//  Created by Jason Chang on 6/14/13.
//  Copyright (c) 2013 Jason Chang. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DetailViewController;

@interface MasterViewController : UITableViewController

@property (strong, nonatomic) DetailViewController *detailViewController;

- (IBAction)openAddTodoController:(id)sender;

@end
