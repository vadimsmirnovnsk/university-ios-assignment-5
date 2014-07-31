//
//  SEAboutVC.m
//  homework-5
//
//  Created by Wadim on 7/28/14.
//  Copyright (c) 2014 Smirnov Electronics. All rights reserved.
//

#import "SEAboutVC.h"

@interface SEAboutVC ()

@property (nonatomic, strong) IBOutlet UITextView *text;

- (IBAction)hitAlert:(id)sender;

@end

@implementation SEAboutVC


- (instancetype) init
{
    if (self=[super init]) {
    // self.title = @"About";
    }
    return self;
}

- (void)viewDidLoad
{
    self.text.scrollEnabled = YES;
}

- (void)hitAlert:(id)sender
{
    UIAlertView *newAlert = [[UIAlertView alloc]initWithTitle:@"Wassup Man"
        message:@"Hey, what did you say about my mama?" delegate:self
        cancelButtonTitle:@"Nothing" otherButtonTitles: nil];
    [newAlert show];
}

@end
