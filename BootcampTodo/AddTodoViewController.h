//
//  AddTodoViewController.h
//  BootcampTodo
//
//  Created by Jason Chang on 6/15/13.
//  Copyright (c) 2013 Jason Chang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddTodoViewController : UITableViewController

@property (nonatomic, strong) IBOutlet UITextField * nameTextField;

//- (IBAction)doneSubmitCallback:(id)sender;
-(IBAction)cancel:(id)sender;
-(IBAction)done:(id)sender;

@end


