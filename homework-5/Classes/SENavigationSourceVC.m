//
//  SENavigationSourceVC.m
//  homework-5
//
//  Created by Wadim on 7/28/14.
//  Copyright (c) 2014 Smirnov Electronics. All rights reserved.
//

#import "SENavigationSourceVC.h"
#import "UIColor+ColorFromHexString.h"

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


-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    NSCharacterSet *chars = [[NSCharacterSet 
        characterSetWithCharactersInString:@"0123456789ABCDEF"] invertedSet];
    if (((NSNotFound == [string rangeOfCharacterFromSet:chars].location) &&
        ([[textField text]length]<=5)) || [string isEqualToString:@"\u2008"]) {
        return YES;
    }
    return NO;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    self.view.backgroundColor = [UIColor colorWithHexString:[textField text]];
    CGFloat redCompose, greenCompose, blueCompose, alpha;
    [self.view.backgroundColor getRed:&redCompose green:&greenCompose blue:&blueCompose alpha:&alpha];
    [_redSlider setValue:redCompose animated:YES];
    [_greenSlider setValue:greenCompose animated:YES];
    [_blueSlider setValue:blueCompose animated:YES];
    return [textField resignFirstResponder];
}

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField
{
    return YES;
}



@end
