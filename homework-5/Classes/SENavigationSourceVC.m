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

@property (nonatomic, strong) IBOutlet UISlider *redSlider;
@property (nonatomic, strong) IBOutlet UISlider *greenSlider;
@property (nonatomic, strong) IBOutlet UISlider *blueSlider;

- (IBAction)updateViewColor:(id)sender;

@end

@implementation SENavigationSourceVC


- (void)viewWillAppear:(BOOL)animated {
     self.title = [NSString stringWithFormat:@"Level: %i",
        [self.navigationController.viewControllers count]];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.view.backgroundColor = [UIColor colorWithRed:self.redSlider.value
        green:self.greenSlider.value blue:self.blueSlider.value alpha:0.9];
}

- (IBAction)pushView:(id)sender
{
    SENavigationSourceVC *pushController = [[SENavigationSourceVC alloc]init];
    [self.navigationController pushViewController:pushController animated:YES];
}

- (void)updateViewColor:(id)sender
{
// self.navigationController.navigationItem.titleView
  self.view.backgroundColor = [UIColor colorWithRed:self.redSlider.value
    green:self.greenSlider.value blue:self.blueSlider.value alpha:0.9];  
}


-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:
    (NSRange)range replacementString:(NSString *)string
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
    [self.view.backgroundColor getRed:&redCompose green:&greenCompose
        blue:&blueCompose alpha:&alpha];
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
