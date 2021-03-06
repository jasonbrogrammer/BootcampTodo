//
//  MasterViewController.m
//  BootcampTodo
//
//  Created by Jason Chang on 6/14/13.
//  Copyright (c) 2013 Jason Chang. All rights reserved.
//

#import "MasterViewController.h"

#import "AddTodoViewController.h"

#import "DetailViewController.h"

#import <Parse/Parse.h>

@interface MasterViewController () {
    NSMutableArray *_objects;
}
@end

@implementation MasterViewController

- (void)awakeFromNib
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
        self.clearsSelectionOnViewWillAppear = NO;
        self.contentSizeForViewInPopover = CGSizeMake(320.0, 600.0);
    }
    [super awakeFromNib];
}

-(void)loadItemsFromParse{
// PFObject
    PFQuery *query = [PFQuery queryWithClassName:@"TodoItem"];
    
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
       // code
        
        if(!error){
            
            [self.refreshControl endRefreshing];
            
            NSLog(@" Parse %@ ", [objects description]);
            
            _objects = [NSMutableArray arrayWithArray:objects];
            [self.tableView reloadData];
        }
        
        
    }];
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    
    UIRefreshControl* refreshControl = [[UIRefreshControl alloc] init];
    self.refreshControl = refreshControl;
    
    
    [refreshControl addTarget:self action:@selector(loadItemsFromParse) forControlEvents:UIControlEventValueChanged];
    
    
    
    [self loadItemsFromParse];
    
    _objects = [[NSMutableArray alloc] init];
    
//    [_objects addObject:[NSDate date]];
//     [_objects addObject:[NSDate date]];
//     [_objects addObject:[NSDate date]];
//     [_objects addObject:[NSDate date]];
    
    
	// Do any additional setup after loading the view, typically from a nib.
    self.navigationItem.leftBarButtonItem = self.editButtonItem;

  //  UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertNewObject:)];
   // self.navigationItem.rightBarButtonItem = addButton;
    
    
    
    self.detailViewController = (DetailViewController *)[[self.splitViewController.viewControllers lastObject] topViewController];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)openAddTodoController:(id)sender{
    
    UINavigationController* navController = [[UINavigationController alloc]init];
    
    AddTodoViewController* addController = [self.storyboard instantiateViewControllerWithIdentifier:@"AddTodoController1"];
    addController.delegate = self;
    [navController pushViewController:addController animated:NO];
    
    [self presentViewController:navController animated:YES completion:nil];
    /*
     
     [navController pushViewController:addController animated:NO];
     
     [self presentViewController:navController animated:YES completion:nil];
     
     
     */
    
}

- (void) addTodoItem:(id)todoItem{
    
    
    
    NSLog(@" Adding TODO ITem =) %@", todoItem);
    
    
    NSMutableDictionary* todoDictionary = [NSMutableDictionary dictionary];
    
    
    [todoDictionary setObject:todoItem forKey:@"name"];
    [todoDictionary setObject:@NO forKey:@"isComplete"];
    
    [_objects insertObject:todoDictionary atIndex:0];
    
  //  [todo saveIn]
    
  //  [_objects insertObject:todoItem atIndex:0];
    PFObject* todo = [PFObject objectWithClassName:@"TodoItem"];
    
    [todo setObject:todoItem forKey:@"name"];
    [todo setObject:@NO forKey:@"isComplete"];
    
    [todo saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        NSLog(@"PARSE save complete: %d",succeeded);
    }];
    
    
 //   NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
 //   [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];

    [self.tableView reloadData];
  //  NSIndexPath
    
}

-(void) toggleButtonPressed:(id)sender{
    UIButton* toggleButton = (UIButton*)sender;
    int row = toggleButton.tag;
    
    NSLog(@"button pressed %d",row);
    
    // grab the dictionary from the model
    NSDictionary* todo = [_objects objectAtIndex:row];
    
    // then set the complete value based on the toggble button
    [todo setValue:[NSNumber numberWithBool:toggleButton.selected] forKey:@"isComplete"];
    
    // notify the table to reload that row
    
    /*
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:row inSection:0];
    
    [self.tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
*/
    
}


- (void)insertNewObject:(id)sender
{
    if (!_objects) {
        _objects = [[NSMutableArray alloc] init];
    }
    [_objects insertObject:[NSDate date] atIndex:0];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _objects.count;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TodoCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    NSDictionary *object = _objects[indexPath.row];
    
    cell.todoNameLabel.text = [object objectForKey:@"name"];
    
  //  cell.todoNameLabel.text = [object description];
    cell.checkboxButton.selected = [[object objectForKey:@"isComplete"]boolValue];
    
    
    
    
    [cell.checkboxButton removeTarget:self action:@selector(toggleButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [cell.checkboxButton addTarget:self action:@selector(toggleButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
   
    
    

    
    cell.checkboxButton.tag = indexPath.row;
    
    return cell;
}


/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];

    NSDate *object = _objects[indexPath.row];
    
    
    
    
    cell.textLabel.text = [object description];
    return cell;
}
*/
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [_objects removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }
}

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
        NSDate *object = _objects[indexPath.row];
        self.detailViewController.detailItem = object;
    }
}
/**
 
 
 
 */
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        NSDate *object = _objects[indexPath.row];
        [[segue destinationViewController] setDetailItem:object];
    }
}

@end
