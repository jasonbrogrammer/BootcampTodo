//
//  AddTodoViewController.m
//  BootcampTodo
//
//  Created by Jason Chang on 6/15/13.
//  Copyright (c) 2013 Jason Chang. All rights reserved.
//

#import "AddTodoViewController.h"

@interface AddTodoViewController ()

@end

@implementation AddTodoViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}


-(IBAction)cancel:(id)sender{
    
    
}

-(IBAction)done:(id)sender{
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
