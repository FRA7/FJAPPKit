//
//  MeViewController_1.m
//  AntRice
//
//  Created by JYH on 16/7/11.
//  Copyright © 2016年 FRAJ. All rights reserved.
//

#import "MeViewController_1.h"
#import "UIColor+RandomColor.h"
#import "RRTableViewController.h"
#import "UINavigationController+FDFullscreenPopGesture.h"


@interface MeViewController_1 ()

@end

@implementation MeViewController_1

#pragma mark - 构造方法


- (void)viewDidLoad {
    [super viewDidLoad];
    
        self.view.backgroundColor = [UIColor randomColor];

    self.fd_prefersNavigationBarHidden = YES;//隐藏当前页面导航
    
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    
    button.frame = CGRectMake(0, [UIScreen mainScreen].bounds.size.width - 220, 171, 44);
    
    [button setTitle:@"跳过来" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor colorWithRed:(255) / 255.0f green:(80) / 255.0f blue:(0) / 255.0f alpha:1] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(jump) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];

    
}

- (void)jump{
    
    RRTableViewController *viewController = [[RRTableViewController alloc] init];
        viewController.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:viewController animated:YES];
    
}

@end
