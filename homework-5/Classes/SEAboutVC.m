//
//  SEAboutVC.m
//  homework-5
//
//  Created by Wadim on 7/28/14.
//  Copyright (c) 2014 Smirnov Electronics. All rights reserved.
//

#import "SEAboutVC.h"

@implementation SEAboutVC

- (instancetype) init
{
    if (self=[super init]) {
    // self.title = @"About";
    self.tabBarItem.image = [UIImage imageNamed:@"pencil"];
    self.view.backgroundColor = [UIColor brownColor];
    }
    return self;
}

- (void)viewDidLoad
{
    
}

@end
