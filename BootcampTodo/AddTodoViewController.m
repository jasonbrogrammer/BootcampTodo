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
    NSLog(@" cancel ");
    [self dismissViewControllerAnimated:YES completion:^{
        
        NSLog(@" callback ");
    }];
}


- (void)startStandardUpdates
{
    // Create the location manager if this object does not
    // already have one.
    if (nil == _locationManager)
        _locationManager = [[CLLocationManager alloc] init];
    
    _locationManager.delegate = self;
    _locationManager.desiredAccuracy = kCLLocationAccuracyKilometer;
    
    // Set a movement threshold for new events.
    _locationManager.distanceFilter = 500;
    
    [_locationManager startUpdatingLocation];
}


// Delegate method from the CLLocationManagerDelegate protocol.
- (void)locationManager:(CLLocationManager *)manager
     didUpdateLocations:(NSArray *)locations {
    // If it's a relatively recent event, turn off updates to save power
    CLLocation* location = [locations lastObject];
    NSDate* eventDate = location.timestamp;
    NSTimeInterval howRecent = [eventDate timeIntervalSinceNow];
    if (abs(howRecent) < 15.0) {
        // If the event is recent, do something with it.
        NSLog(@"latitude %+.6f, longitude %+.6f\n",
              location.coordinate.latitude,
              location.coordinate.longitude);
    }
}

-(void) viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
//    [super viewDidAppear:<#animated#>];
    
    [self startStandardUpdates];
    
}

-(IBAction)done:(id)sender{
    NSLog(@" done");
    
    NSString* todoName = self.nameTextField.text;
    
 //   [[NSNotificationCenter defaultCenter] postNotificationName:@"TodoCreated" object:todoName];
    
    
    if(self.delegate){
        if([self.delegate respondsToSelector:@selector(addTodoItem:)]){
            [self.delegate performSelector:@selector(addTodoItem:) withObject:todoName];
        }
    }
    
    [self dismissViewControllerAnimated:YES completion:^{
        
        NSLog(@" callback ");
    }];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
