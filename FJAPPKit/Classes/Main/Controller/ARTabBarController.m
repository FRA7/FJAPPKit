//
//  ARTabBarController.m
//  AntRice
//
//  Created by JYH on 16/5/17.
//  Copyright © 2016年 JYH. All rights reserved.
//  底部Tabbar控制器--主控制器

#import "ARTabBarController.h"
#import "UIImage+Image.h"
#import "ARTabBar.h"
#import "ARNavigationController.h"

#import "HomeViewController.h"
#import "FinanceViewController.h"
#import "MeViewController_1.h"
#import "MoreViewController_1.h"

#define ARColor(r, g, b) \
[UIColor colorWithRed:(r) / 255.0f \
green:(g) / 255.0f \
blue:(b) / 255.0f \
alpha:1]


#define TABBAR_NORMAL_COLOR ARColor(146, 146, 146)
#define TABBAR_SELECTED_COLOR ARColor(255, 80, 0)

@interface ARTabBarController ()<UITabBarDelegate>
@property (nonatomic,strong)NSUserDefaults *defaults;


@end

@implementation ARTabBarController

//只会调用一次,类加载的时候就调用
+(void)load{
    
    //1.获取当前类下的所有tabbar
    UITabBarItem *item = [UITabBarItem appearanceWhenContainedIn:self, nil];
    
    NSMutableDictionary *attrSel = [NSMutableDictionary dictionary];
    attrSel[NSForegroundColorAttributeName] = TABBAR_SELECTED_COLOR;
    [item setTitleTextAttributes:attrSel forState:UIControlStateSelected];
    
    NSMutableDictionary *attrNor = [NSMutableDictionary dictionary];
    attrNor[NSFontAttributeName] = [UIFont systemFontOfSize:11];
    attrNor[NSForegroundColorAttributeName] = TABBAR_NORMAL_COLOR;
    [item setTitleTextAttributes:attrNor forState:UIControlStateNormal];
    
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //初始化数据缓存
    _defaults =[NSUserDefaults standardUserDefaults];
    [self setUpChildViewController];
    
    [self setUpTabBarButton];
    
    ARTabBar *tabBar = [[ARTabBar alloc] init];
    [self setValue:tabBar forKeyPath:@"tabBar"];
    
    self.delegate = self;
   
    
}






- (void)setUpTabBarButton{
    
    //首页
    UINavigationController *nav1 = self.childViewControllers[0];
    nav1.tabBarItem.title = @"首页";
    nav1.tabBarItem.image = [UIImage imageNameWithOriginalMode:@"TabBar_首页"];
    nav1.tabBarItem.selectedImage = [UIImage imageNameWithOriginalMode:@"TabBar_首页_点击"];
    
    //理财
    UINavigationController *nav2 = self.childViewControllers[1];
    nav2.tabBarItem.title = @"投资理财";
    nav2.tabBarItem.image = [UIImage imageNameWithOriginalMode:@"TabBar_投资理财"];
    nav2.tabBarItem.selectedImage = [UIImage imageNameWithOriginalMode:@"TabBar_投资理财_点击"];
    
    //我的
    UINavigationController *nav3 = self.childViewControllers[2];
    nav3.tabBarItem.title = @"我的资产";
    nav3.tabBarItem.image = [UIImage imageNameWithOriginalMode:@"TabBar_我的"];
    nav3.tabBarItem.selectedImage = [UIImage imageNameWithOriginalMode:@"TabBar_我的_点击"];
    
    //更多
    UINavigationController *nav4 = self.childViewControllers[3];
    nav4.tabBarItem.title = @"更多";
    nav4.tabBarItem.image = [UIImage imageNameWithOriginalMode:@"TabBar_更多"];
    nav4.tabBarItem.selectedImage = [UIImage imageNameWithOriginalMode:@"TabBar_更多_点击"];
    
}

- (void)setUpChildViewController{
    
    //首页
    HomeViewController *homeVC = [[HomeViewController alloc] init];
    [self addChildViewController:homeVC];
    
    //理财
    FinanceViewController *financeVC = [[FinanceViewController alloc] init];
    [self addChildViewController:financeVC];
    
    //我的
    MeViewController_1 *meVC = [[MeViewController_1 alloc] init];
    [self addChildViewController:meVC];
   
    
    //更多
    MoreViewController_1 *moreVC = [[MoreViewController_1 alloc] init];
    [self addChildViewController:moreVC];
    
}

- (void)addChildViewController:(UIViewController *)childController{

    ARNavigationController *nav = [[ARNavigationController alloc] initWithRootViewController:childController];
    [super addChildViewController:nav];
    
}




@end
