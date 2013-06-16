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
    
    
    
    [customButton addTarget:self action:@selector(navigateToOtherController:) forControlEvents:UIControlEventTouchUpInside];
    
//    self.helloWorldLabel.text = @"Hello World";
    self.textField.delegate = self;
    self.textField.returnKeyType = UIReturnKeyDone;
    

    
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

- (BOOL) textFieldShouldReturn:(UITextField *)textField{
    
    [self.textField resignFirstResponder];
    return NO;
}

- (BOOL) textFieldShouldBeginEditing:(UITextField *)textField{
    
    [UIView animateWithDuration:0.5f animations:^{
        self.view.top -= 100;
    }];
    
    
    /**
     
     animations:^{
     self.view.top += 100;
     }];
     
     */
    return YES;
    
    
}


- (BOOL) textFieldShouldEndEditing:(UITextField *)textField{
    
    [UIView animateWithDuration:0.5f animations:^{
        self.view.top += 100;
    }];
    
    
    /**
     
     animations:^{
     self.view.top += 100;
     }];
     
     */
    return YES;
    
    
}

-(IBAction)navigateToOtherController:(id)sender
{
    
    
    if([self.textField isFirstResponder]){
        [self.textField resignFirstResponder];
        
        
    }else{
        [self.textField becomeFirstResponder];
        
        
        
        
        
    }
    
       
    
    /*
     UIViewController* empty = [self.storyboard instantiateViewControllerWithIdentifier:@"ResultControllerSB"];
     
     empty.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
     
     [self presentViewController:empty animated:YES completion:^{
     
     
     [self dismissViewControllerAnimated:YES completion:nil];
     }];
     
     // [self.navigationController pushViewController:empty animated:YES];
     
     NSLog(@"button pressed");
     */
    
}

@end
