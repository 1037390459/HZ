//
//  AppDelegate.m
//  HZ
//
//  Created by 李灿 on 2019/9/16.
//  Copyright © 2019 李灿. All rights reserved.
//

#import "AppDelegate.h"
#import "LoginViewController.h"

#import "Device/Controller/DeviceViewController.h"
#import "Market/Controller/MarketViewController.h"
#import "Advisory/Controller/AdvisoryViewController.h"
#import "MineTableViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [self setupGlobalConfig];
    [self setLoginRootVC];
    return YES;
}

- (void)setupGlobalConfig {
    [[UINavigationBar appearance] setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    [[UINavigationBar appearance] setShadowImage:[UIImage new]];
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor], NSFontAttributeName : [UIFont systemFontOfSize:18]}];
    [UINavigationBar appearance].tintColor = [UIColor whiteColor];
    
    //设置UIBarButtonItem在导航栏默认样式
    UIBarButtonItem *barButtonItem = [UIBarButtonItem appearanceWhenContainedInInstancesOfClasses:@[UINavigationBar.class]];
    barButtonItem.tintColor = [UIColor whiteColor];
    
    [UITableViewHeaderFooterView appearance].tintColor = [UIColor clearColor];

    //设置userdefaults默认值
    NSDictionary *defaultValues =  @{};
    [[NSUserDefaults standardUserDefaults] registerDefaults:defaultValues];
}

- (void)setLoginRootVC{
    LoginViewController * loginVC = [[LoginViewController alloc]init];
    QMUINavigationController * loginNa = [[QMUINavigationController alloc]initWithRootViewController:loginVC];
    [self.window setRootViewController:loginNa];
    [self.window makeKeyAndVisible];
}

- (void)setRootVC{
    QMUITabBarViewController * mainTabbarController = [[QMUITabBarViewController alloc]init];
    [mainTabbarController.tabBar setBackgroundImage:[SingleHelper imageWithColor:UIColorMake(50, 50, 50)]];
    // 设备
    DeviceViewController * deviceVC = [[DeviceViewController alloc]init];
    deviceVC.title = @"我的设备";
    deviceVC.hidesBottomBarWhenPushed = NO;
    QMUINavigationController * deviceNa = [[QMUINavigationController alloc]initWithRootViewController:deviceVC];
    deviceNa.tabBarItem.image = [UIImageMake(@"tabbar_device") imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    deviceNa.tabBarItem.selectedImage = [UIImageMake(@"tabbar_deviceSelected") imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    deviceNa.tabBarItem.title = @"设备";
    [deviceNa.tabBarItem setTitleTextAttributes:[SingleHelper getAttributesWithFont:UIFontMake(12.0) andColor:[UIColor redColor]] forState:UIControlStateSelected];
    // 商城
    MarketViewController * marketVC = [[MarketViewController alloc]init];
    marketVC.hidesBottomBarWhenPushed = NO;
    QMUINavigationController * marketNa = [[QMUINavigationController alloc]initWithRootViewController:marketVC];
    marketNa.tabBarItem.image = [UIImageMake(@"tabbar_market") imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    marketNa.tabBarItem.selectedImage = [UIImageMake(@"tabbar_marketSelected") imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    marketNa.tabBarItem.title = @"商城";
    [marketNa.tabBarItem setTitleTextAttributes:[SingleHelper getAttributesWithFont:UIFontMake(12.0) andColor:[UIColor redColor]] forState:UIControlStateSelected];
    // 咨询
    AdvisoryViewController * advisoryVC = [[AdvisoryViewController alloc]init];
    advisoryVC.title = @"咨询";
    advisoryVC.hidesBottomBarWhenPushed = NO;
    QMUINavigationController * advisoryNa = [[QMUINavigationController alloc]initWithRootViewController:advisoryVC];
    advisoryNa.tabBarItem.image = [UIImageMake(@"tabbar_advisory") imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    advisoryNa.tabBarItem.selectedImage = [UIImageMake(@"tabbar_advisorySelected") imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [advisoryNa.tabBarItem setTitleTextAttributes:[SingleHelper getAttributesWithFont:UIFontMake(12.0) andColor:[UIColor redColor]] forState:UIControlStateSelected];
    // 我的
    MineTableViewController * mineVC = [UIStoryboard storyboardWithName:@"Mine" bundle:nil].instantiateInitialViewController;
    mineVC.title = @"我的";
    mineVC.hidesBottomBarWhenPushed = NO;
    QMUINavigationController * mineNa = [[QMUINavigationController alloc]initWithRootViewController:mineVC];
    mineNa.tabBarItem.image = [UIImageMake(@"tabbar_mine") imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    mineNa.tabBarItem.selectedImage = [UIImageMake(@"tabbar_mineSelected") imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [mineNa.tabBarItem setTitleTextAttributes:[SingleHelper getAttributesWithFont:UIFontMake(12.0) andColor:[UIColor redColor]] forState:UIControlStateSelected];
    
    mainTabbarController.viewControllers = @[deviceNa, marketNa, advisoryNa, mineNa];
    [self.window setRootViewController:mainTabbarController];
    [self.window makeKeyAndVisible];
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
