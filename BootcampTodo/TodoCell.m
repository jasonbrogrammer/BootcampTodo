//
//  TodoCell.m
//  BootcampTodo
//
//  Created by Jason Chang on 6/15/13.
//  Copyright (c) 2013 Jason Chang. All rights reserved.
//

#import "TodoCell.h"

@implementation TodoCell



-(id) initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if(self){
        // do constructor stuff here
    }
    
    return self;
}



- (void) setCheckboxButton:(UIButton *)checkboxButton {
    _checkboxButton = checkboxButton;
    
    [_checkboxButton setTitle:@"X" forState:UIControlStateSelected];
    
    [_checkboxButton addTarget:self action:@selector(onButtonPressed) forControlEvents:UIControlEventTouchUpInside];
}





- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        
        /*
        [self.checkboxButton addTarget:self action:@selector(onButtonPressed) forControlEvents:UIControlEventTouchUpInside)];
        
        */
    }
    return self;
}

- (void) onButtonPressed{
    NSLog(@" checkbox button pressed =) ");
     self.checkboxButton.selected = !self.checkboxButton.selected;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
