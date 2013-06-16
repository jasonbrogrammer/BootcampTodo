//
//  AddTodoViewController.h
//  BootcampTodo
//
//  Created by Jason Chang on 6/15/13.
//  Copyright (c) 2013 Jason Chang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@protocol RespondsToAddTodo <NSObject>

-(void) addTodoItem:(id)todoItem;

@end

@interface AddTodoViewController : UITableViewController <CLLocationManagerDelegate>{
    CLLocationManager* _locationManager;
}

@property (nonatomic, strong) IBOutlet UITextField * nameTextField;
@property (nonatomic, assign) id<RespondsToAddTodo> delegate;
//- (IBAction)doneSubmitCallback:(id)sender;
-(IBAction)cancel:(id)sender;
-(IBAction)done:(id)sender;

@end


