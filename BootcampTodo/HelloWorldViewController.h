//
//  HelloWorldViewController.h
//  BootcampTodo
//
//  Created by Jason Chang on 6/14/13.
//  Copyright (c) 2013 Jason Chang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HelloWorldViewController : UIViewController <UITextFieldDelegate>

@property (nonatomic,strong) IBOutlet UILabel* helloWorldLabel;

@property (nonatomic,strong) IBOutlet UIButton* helloWorldButton;

@property (nonatomic, strong) IBOutlet UINavigationController* controller;

@property (nonatomic,strong) IBOutlet UITextField* textField;

- (IBAction)navigateToOtherController:(id)sender;

@end
