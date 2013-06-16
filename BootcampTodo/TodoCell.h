//
//  TodoCell.h
//  BootcampTodo
//
//  Created by Jason Chang on 6/15/13.
//  Copyright (c) 2013 Jason Chang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TodoCell : UITableViewCell


-(id) initWithCoder:(NSCoder *)aDecoder;

@property (nonatomic,strong) IBOutlet UIButton* checkboxButton;

@property (nonatomic,strong) IBOutlet UILabel* todoNameLabel;

@end
