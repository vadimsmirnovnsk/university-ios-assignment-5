//
//  UIColor+ColorFromHexString.m
//  homework-5
//
//  Created by Wadim on 7/31/14.
//  Copyright (c) 2014 Smirnov Electronics. All rights reserved.
//

#import "UIColor+ColorFromHexString.h"

@implementation UIColor (ColorFromHexString)

+ (UIColor *) colorWithHexString:(NSString *)string
{
    NSString *newString = nil;
    if ([string length]<6) {
        newString = [string stringByAppendingString:
            [@"000000" substringFromIndex:[string length]]];
    }
    else if ([string length]>6) {
        newString = [string substringToIndex:5];
    }
    else {
        newString = [string copy];
    }
    unsigned int colorInt = 0;
    [[NSScanner scannerWithString:newString] scanHexInt:&colorInt];
    return [UIColor colorWithRed:(CGFloat)((colorInt&0xFF0000)>>16)/255.0
        green:(CGFloat)((colorInt&0x00FF00)>>8)/255.0
        blue:(CGFloat)((colorInt&0x0000FF))/255.0
        alpha:0.9];
}

@end
