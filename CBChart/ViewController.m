//
//  ViewController.m
//  CBChart
//
//  Created by pacific on 14/11/28.
//  Copyright (c) 2014年 pacific. All rights reserved.
//

#import "ViewController.h"
#import "Demo1ViewController.h"
#import "Demo2ViewController.h"


@interface ViewController ()

- (IBAction)btnClick:(UIButton *)sender;



@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
}




- (IBAction)btnClick:(UIButton *)sender {
    
    if (sender.tag == 1) {
        Demo1ViewController *demo1 = [[Demo1ViewController alloc] init];
        [self.navigationController pushViewController:demo1 animated:YES];
    }else{
        Demo2ViewController *demo2 = [[Demo2ViewController alloc] init];
        [self.navigationController pushViewController:demo2 animated:YES];
    }
    
}
@end
