//
//  ARNavigationController.m
//  AntRice
//
//  Created by JYH on 16/5/17.
//  Copyright © 2016年 JYH. All rights reserved.
//  导航控制器-全局

#import "ARNavigationController.h"
#import "UIImage+Color.h"

//导航条标题文字颜色
#define NAVIGATION_TITLE_COLOR [UIColor colorWithRed:(255) / 255.0f green:(255) / 255.0f blue:(255) / 255.0f alpha:1]

@interface ARNavigationController ()<UIGestureRecognizerDelegate>
@property (nonatomic,strong)NSUserDefaults *defaults;

@end

@implementation ARNavigationController

+(void)load{
    
    //获取当前类下所有navigationBar Item
    UINavigationBar *navBar = [UINavigationBar appearanceWhenContainedIn:self, nil];
    
    //设置导航栏标题
    NSMutableDictionary *attr = [NSMutableDictionary dictionary];
    attr[NSFontAttributeName] = [UIFont systemFontOfSize:17];
    attr[NSForegroundColorAttributeName] = NAVIGATION_TITLE_COLOR;
    [navBar setTitleTextAttributes:attr];
    //设置导航栏背景颜色
    [navBar setBackgroundImage:[UIImage imageWithColor:[UIColor colorWithRed:(255) / 255.0f green:(80) / 255.0f blue:(0) / 255.0f alpha:1] size:CGSizeMake([UIScreen mainScreen].bounds.size.width, 64)] forBarMetrics:UIBarMetricsDefault];
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    if (self.childViewControllers.count > 0) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setImage:[UIImage imageNamed:@"返回按钮"] forState:UIControlStateNormal];
        [button setImage:[UIImage imageNamed:@"返回按钮"] forState:UIControlStateHighlighted];
        [button sizeToFit];
        
        [button addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
        //设置内容边距
        button.contentEdgeInsets = UIEdgeInsetsMake(0, -11, 0, 0);
        
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
        
    }
    [super pushViewController:viewController animated:YES];
}

-(void)back{
    //初始化数据缓存
    _defaults =[NSUserDefaults standardUserDefaults];
    if ([[_defaults objectForKey:@"banksuccess11"] isEqualToString:@"银行卡绑定成功"]) {
        self.tabBarController.selectedIndex = 1;
    }else{
    
        [self popViewControllerAnimated:YES];
    }
    
    [_defaults removeObjectForKey:@"banksuccess11"];
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    

    //自定义返回按钮后重新设置边缘的滑动返回
    self.interactivePopGestureRecognizer.delegate =  self;
    
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(loginViewControllerDismiss) name:@"loginViewControllerCloseBtnClick" object:nil];
}

-(void)loginViewControllerDismiss{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
    if (self.viewControllers.count <= 1 ) {
        return NO;
    }
    
    return YES;
}


@end
