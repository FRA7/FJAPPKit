//
//  HomeViewController.m
//  AntRice
//
//  Created by JYH on 16/5/26.
//  Copyright © 2016年 FRAJ. All rights reserved.
//  首页控制器

#import "HomeViewController.h"
#import "UIColor+RandomColor.h"
#import "RRTableViewController.h"


@interface HomeViewController ()




@end

@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"首页";
//    self.navigationController.navigationBar.barTintColor = [UIColor randomColor];
    self.view.backgroundColor = [UIColor randomColor];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Next" style:UIBarButtonItemStylePlain target:self action:@selector(didTapNextButton)];
    
}


-(void)didTapNextButton{
    RRTableViewController *viewController = [[RRTableViewController alloc] init];
    viewController.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:viewController animated:YES];
}

@end
