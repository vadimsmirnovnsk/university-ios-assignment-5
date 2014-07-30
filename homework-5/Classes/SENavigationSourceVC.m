//
//  SENavigationSourceVC.m
//  homework-5
//
//  Created by Wadim on 7/28/14.
//  Copyright (c) 2014 Smirnov Electronics. All rights reserved.
//

#import "SENavigationSourceVC.h"

@interface SENavigationSourceVC ()

@property (nonatomic, strong) NSNumber *level;

@end

@implementation SENavigationSourceVC


- (instancetype) initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
    number:(NSNumber *)levelNumber
{
    if (self=[super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
    _level = levelNumber;
    self.title = [NSString stringWithFormat:@"Level: %i",[_level intValue]];
    }
    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.view.backgroundColor = [UIColor colorWithRed:self.redSlider.value green:self.greenSlider.value blue:self.blueSlider.value alpha:0.9];
}

- (IBAction)pushView:(id)sender
{
    [self.navigationController pushViewController:[[SENavigationSourceVC alloc]initWithNibName:self.nibName bundle:self.nibBundle number:[NSNumber numberWithInt:[_level intValue]+1]] animated:YES];
}

- (void)updateViewColor:(id)sender
{
  self.view.backgroundColor = [UIColor colorWithRed:self.redSlider.value
    green:self.greenSlider.value blue:self.blueSlider.value alpha:0.9];  
}

@end
