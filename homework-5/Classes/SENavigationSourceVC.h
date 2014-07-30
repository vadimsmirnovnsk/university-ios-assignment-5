//
//  SENavigationSourceVC.h
//  homework-5
//
//  Created by Wadim on 7/28/14.
//  Copyright (c) 2014 Smirnov Electronics. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SENavigationSourceVC : UIViewController

@property (nonatomic, strong) IBOutlet UISlider *redSlider;
@property (nonatomic, strong) IBOutlet UISlider *greenSlider;
@property (nonatomic, strong) IBOutlet UISlider *blueSlider;

- (instancetype) initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
    number:(NSNumber *)levelNumber;
- (IBAction)updateViewColor:(id)sender;

@end
