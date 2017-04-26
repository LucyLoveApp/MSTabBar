//
//  MSHomeViewController.m
//  MSTabBar
//
//  Created by 邦农 on 17/4/25.
//  Copyright © 2017年 CoderMSZhang. All rights reserved.
//

#import "MSHomeViewController.h"
//自定义tabBar
#import "MSTabBar.h"
//发布页面
#import "MSPublishViewController.h"

@interface MSHomeViewController ()

@end

@implementation MSHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"新浪微博";
    
    //tabBar的基本设置
    [self setupTabBar];
    
    //添加子控制器
    [self setupChildVcWith:[[UIViewController alloc] init] title:@"首页" image:@"tabbar_home" selectImage:@"tabbar_home_selected"];
    
    [self setupChildVcWith:[[UIViewController alloc] init] title:@"消息" image:@"toolbar_compose" selectImage:@"toolbar_compose_highlighted"];
    
    [self setupChildVcWith:[[UIViewController alloc] init] title:@"发现" image:@"tabbar_discover" selectImage:@"tabbar_discover_selected"];
    
    [self setupChildVcWith:[[UIViewController alloc] init] title:@"我的" image:@"tabbar_profile" selectImage:@"tabbar_profile_selected"];
    
    /**更换tabBar
     *tabBar为readonly只读属性，通过KVC修改
     *self.tabBar = [[MSTabBar alloc] init];此方法报错
     */
    MSTabBar *tabBar = [[MSTabBar alloc] init];
    [self setValue:tabBar forKeyPath:@"tabBar"];
    
    
    
    //回调Block
    tabBar.publishBtnClick = ^(){
        //跳转到发布页面
        MSPublishViewController *plus = [[MSPublishViewController alloc]init];
        [self presentViewController:plus animated:YES completion:nil];
    };
    
}

/** 
 *tabBar基本设置
 */
-(void)setupTabBar
{
    //正常状态下的字体大小和颜色
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    attrs[NSFontAttributeName] = [UIFont systemFontOfSize:12.0];
    attrs[NSForegroundColorAttributeName] = [UIColor grayColor];
    
    //选中状态下的的字体大小和颜色
    NSMutableDictionary *selectAttrs = [NSMutableDictionary dictionary];
    selectAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:12.0];
    selectAttrs[NSForegroundColorAttributeName] = [UIColor colorWithRed:1.0 green:130/255.0 blue:0 alpha:1.0];
    
    //统一设置
    UITabBarItem *item = [UITabBarItem appearance];
    [item setTitleTextAttributes:attrs forState:UIControlStateNormal];
    [item setTitleTextAttributes:selectAttrs forState:UIControlStateSelected];
}



/**
 *初始化子控制器
 */
-(void)setupChildVcWith:(UIViewController *)vc title:(NSString *)title image:(NSString *)image selectImage:(NSString *)selectImage
{
    vc.view.backgroundColor = [UIColor colorWithRed:arc4random_uniform(100)/100.0 green:arc4random_uniform(100)/100.0 blue:arc4random_uniform(100)/100.0 alpha:1.0];
    vc.tabBarItem.title = title;
    vc.tabBarItem.image = [UIImage imageNamed:image];
    vc.tabBarItem.selectedImage = [UIImage imageNamed:selectImage];
    [self addChildViewController:vc];
}



@end


















