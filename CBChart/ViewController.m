//
//  ViewController.m
//  CBChart
//
//  Created by pacific on 14/11/28.
//  Copyright (c) 2014年 pacific. All rights reserved.
//

#import "ViewController.h"
#import "DemoViewController.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    
    
}

#pragma mark - tableDataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc] init];
    
    cell.textLabel.text = [NSString stringWithFormat:@"CBChartDemo-%lud", indexPath.row];
    
    return cell;
}

#pragma mark - tableDelegate
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIViewController *viewController = [[NSClassFromString(@"DemoViewController") alloc] init];
    
    [self.navigationController showViewController:viewController sender:@"hello"];
    
    
//    UINavigationController *nav = self.navigationController;
//    
//    
//    [self.navigationController addChildViewController:viewController];
//    
//    UIView *rootView = self.view.superview;
//    
//    CATransition *pushAnimation = [CATransition animation];
//    pushAnimation.duration = 0.5;
    
}

@end
