//
//  ViewController.m
//  ProjectA
//
//  Created by 罗兆熙 on 2019/9/3.
//  Copyright © 2019 罗兆熙. All rights reserved.
//

#import "ViewController.h"
#import "NSString+Extension.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *contentLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *timeStamp = @"1572761982";
    self.contentLabel.text = [timeStamp getDateStringByFormat:@"Y年M月d日"];
}


@end
