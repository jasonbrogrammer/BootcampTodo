//
//  MasterViewController.h
//  BootcampTodo
//
//  Created by Jason Chang on 6/14/13.
//  Copyright (c) 2013 Jason Chang. All rights reserved.
//
#import "TodoCell.h"
#import "AddTodoViewController.h"
#import <UIKit/UIKit.h>

@class DetailViewController;

@interface MasterViewController : UITableViewController <RespondsToAddTodo>

@property (strong, nonatomic) DetailViewController *detailViewController;

- (IBAction)openAddTodoController:(id)sender;

- (void) addTodoItem:(id)todoItem;

@end
