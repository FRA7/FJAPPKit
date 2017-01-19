//
//  ARTabBar.m
//  AntRice
//
//  Created by JYH on 16/5/17.
//  Copyright © 2016年 JYH. All rights reserved.
//

#import "ARTabBar.h"

@interface ARTabBar()

/** 记录上一次被点击按钮的tag*/
@property (nonatomic ,assign) NSInteger previousClickedTabBarButtonTag;
@property (nonatomic,strong)NSUserDefaults *defaults;


@end

@implementation ARTabBar



-(void)layoutSubviews{
    
    [super layoutSubviews];
    //初始化数据缓存
    _defaults =[NSUserDefaults standardUserDefaults];
    
    //设置tabbar背景颜色
    UIView *bgView = [[UIView alloc] initWithFrame:self.bounds];
    bgView.backgroundColor = [UIColor whiteColor];
    [self insertSubview:bgView atIndex:1];
    self.opaque = YES;
    
    NSInteger count = self.items.count;
    
    //调整内部子控件位置
    CGFloat btnX = 0;
    CGFloat btnY = 0;
    CGFloat btnW = self.frame.size.width / count;
    CGFloat btnH = self.frame.size.height;
    
    NSInteger i = 0;
    for (UIControl *tabBarButton in self.subviews) {
        if ([tabBarButton isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            
            btnX = i * btnW;
            
            tabBarButton.frame = CGRectMake(btnX, btnY, btnW, btnH);
            
            tabBarButton.tag = i;
            
            i++;
            
            //监听tabBar点击
            [tabBarButton addTarget:self action:@selector(tabbarButtonClick:) forControlEvents:UIControlEventTouchUpInside];
           
        }
        
    }
    //保存当前被点击的按钮-初始化时
    [[NSUserDefaults standardUserDefaults] setInteger:self.previousClickedTabBarButtonTag forKey:@"last_tabBarButton_tag"];
    
    
}



#pragma mark - 监听按钮点击
-(void)tabbarButtonClick:(UIControl *)tabBarButton{
//    if (tabBarButton.tag == 2&& [_defaults objectForKey:@"loginSuceed"])
//    {
//        [[NSNotificationCenter defaultCenter] postNotificationName:@"faile" object:nil];
//    }else{
    //保存当前被点击的按钮-按钮点击时
    [[NSUserDefaults standardUserDefaults] setInteger:self.previousClickedTabBarButtonTag forKey:@"last_tabBarButton_tag"];
    NSInteger lastSelsecd = [[NSUserDefaults standardUserDefaults] integerForKey:@"last_tabBarButton_tag"];
    
    if (self.previousClickedTabBarButtonTag == tabBarButton.tag) {
        [[NSNotificationCenter defaultCenter] postNotificationName:@"FJTabBarButtonDidRepeatClickedNotification" object:nil];
        
    }
    self.previousClickedTabBarButtonTag = tabBarButton.tag;
 
    
}


@end
