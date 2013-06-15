//
//  HelloWorldViewController.m
//  BootcampTodo
//
//  Created by Jason Chang on 6/14/13.
//  Copyright (c) 2013 Jason Chang. All rights reserved.
//

#import "HelloWorldViewController.h"
//#import "UIView+GeometryAdditions.h"
@interface HelloWorldViewController ()

@end

@implementation HelloWorldViewController
/*
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
*/
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.helloWorldLabel.text = @"Hello World!";
    //self.helloWorldButton.
    
    UIButton* customButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    
    [customButton setTitle:@"custom button" forState:UIControlStateNormal];
    [customButton sizeToFit];
    [self.view addSubview:customButton];
    
    customButton.left=20;
   // customButton.right = 20;
    customButton.top = 100;
   
    //self.view
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(IBAction)navigateToOtherController:(id)sender
{
    
    
}

@end
