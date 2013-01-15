//
//  PTPAppDelegate.m
//  Pry_Tsno_Proj
//
//  Created by ulybu on 12/01/13.
//  Copyright (c) 2013 ulybu. All rights reserved.
//

#import "PTPAppDelegate.h"
#import "PTPVinsViewController.h"
#import "PTPCoursViewController.h"
#import "PTPCommandesViewController.h"
#import "PTPVideosViewController.h"
#import "PTPProfilViewController.h"
#import "PTPAboutViewController.h"
#import "WineViewController.h"
#import "CourseListViewController.h"
#import "ShoppingListViewController.h"



@implementation PTPAppDelegate
@synthesize tabBarController=_tabBarController;
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{ 
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
   
    UIViewController *vinsViewController, *coursViewController, *commandesViewController,*videosViewController,*profilViewController,*aboutViewController;
    
    //    VINS
    vinsViewController = [[WineViewController alloc] initWithNibName:@"WineViewController" bundle:nil];
    UITabBarItem *tabBarItemVins= [[UITabBarItem alloc] initWithTitle:@"Vins"
                                                                image: [UIImage imageNamed:@"wine-glass.png"] tag:1];
    vinsViewController.tabBarItem=tabBarItemVins;
    
    //        COURS
    coursViewController = [[CourseListViewController alloc] initWithNibName:@"CourseListViewController" bundle:nil];
    UITabBarItem *tabBarItemCours= [[UITabBarItem alloc] initWithTitle:@"Cours"
                                                                 image: [UIImage imageNamed:@"calendar.png"] tag:2];
    coursViewController.tabBarItem=tabBarItemCours;
    
    //        COMMANDES
    commandesViewController = [[ShoppingListViewController alloc] initWithNibName:@"ShoppingListViewController" bundle:nil];
    
    UITabBarItem *tabBarItemCommande= [[UITabBarItem alloc] initWithTitle:@"Achats"
                                                                    image: [UIImage imageNamed:@"shopping-cart.png"] tag:3];
    commandesViewController.tabBarItem=tabBarItemCommande;
    
    //        VIDEOS
    
    videosViewController = [[PTPVideosViewController alloc] initWithNibName:@"PTPVideosViewController" bundle:nil];
    
    UITabBarItem *tabBarItemTV= [[UITabBarItem alloc] initWithTitle:@"Videos"
                                                              image: [UIImage imageNamed:@"tv.png"] tag:4];
    videosViewController.tabBarItem=tabBarItemTV;
    
    //        PROFIL
    profilViewController = [[PTPProfilViewController alloc] initWithNibName:@"PTPProfilViewController" bundle:nil];
    UITabBarItem *tabBarItemProfil= [[UITabBarItem alloc] initWithTitle:@"Profil"
                                                                  image: [UIImage imageNamed:@"user.png"] tag:5];
    profilViewController.tabBarItem=tabBarItemProfil;
    
    //        ABOUT
    
    aboutViewController = [[PTPAboutViewController alloc] initWithNibName:@"PTPAboutViewController" bundle:nil];
    UITabBarItem *tabBarItemAbout= [[UITabBarItem alloc] initWithTitle:@"A Propos"
                                                                 image: [UIImage imageNamed:@"info1.png"] tag:6];
    aboutViewController.tabBarItem=tabBarItemAbout;
    
//    ********
//    NAVIGATION
    
    UINavigationController *vinsNavigationController, *coursNavigationController,*shoppingNavigationController, *profilNavigationController;
    
//    VINS
    vinsNavigationController = [[UINavigationController alloc] initWithRootViewController:vinsViewController];
//    vinsNavigationController.title = @"Vins";
    [vinsNavigationController setNavigationBarHidden:NO];
    
//    COURS
    coursNavigationController = [[UINavigationController alloc] initWithRootViewController:coursViewController];
    coursNavigationController.title = @"Cours";
    [coursNavigationController setNavigationBarHidden:NO];
    
//    SHOPPING
    shoppingNavigationController = [[UINavigationController alloc] initWithRootViewController:commandesViewController];
    coursNavigationController.title = @"Cours";
    [coursNavigationController setNavigationBarHidden:NO];
    
    
//    PROFIL
    profilNavigationController = [[UINavigationController alloc] initWithRootViewController:profilViewController];
//    profilNavigationController.title = @";
    [profilNavigationController setNavigationBarHidden:NO];
    
    
    self.tabBarController = [[UITabBarController alloc] init];
    self.tabBarController.viewControllers = @[vinsNavigationController, coursNavigationController,shoppingNavigationController,videosViewController,profilNavigationController,aboutViewController];
    self.window.rootViewController = self.tabBarController;

    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
