//
//  GlobalDateFormatter.m
//  ProjectA
//
//  Created by 罗兆熙 on 2019/9/3.
//  Copyright © 2019 罗兆熙. All rights reserved.
//

#import "GlobalDateFormatter.h"

@implementation GlobalDateFormatter

static NSDateFormatter *dateFormat;

+(NSDateFormatter *)shareGlobalDateFormatter
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        dateFormat = [[NSDateFormatter alloc] init];
        [dateFormat setLocale:[NSLocale currentLocale]];
        [dateFormat setDateFormat: @"YYYY-MM-dd HH-mm-ss"];
    });
    return dateFormat;
}



@end
