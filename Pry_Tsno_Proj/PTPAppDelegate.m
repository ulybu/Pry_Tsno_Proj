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



@implementation PTPAppDelegate
@synthesize tabBarController=_tabBarController;
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{ 
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    UIViewController *vinsController, *coursViewController, *commandesViewController,*videosViewController,*profilViewController,*aboutViewController;
    
    //    VINS
    //    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
    vinsController = [[PTPVinsViewController alloc] initWithNibName:@"PTPVinsViewController" bundle:nil];
    UITabBarItem *tabBarItemVins= [[UITabBarItem alloc] initWithTitle:@"Vins"
                                                                image: [UIImage imageNamed:@"wine-glass.png"] tag:1];
    vinsController.tabBarItem=tabBarItemVins;
    
    //        COURS
    coursViewController = [[PTPCoursViewController alloc] initWithNibName:@"PTPCoursViewController" bundle:nil];
    UITabBarItem *tabBarItemCours= [[UITabBarItem alloc] initWithTitle:@"Cours"
                                                                 image: [UIImage imageNamed:@"calendar.png"] tag:1];
    coursViewController.tabBarItem=tabBarItemCours;
    
    //        COMMANDES
    commandesViewController = [[PTPCommandesViewController alloc] initWithNibName:@"PTPCommandesViewController" bundle:nil];
    
    UITabBarItem *tabBarItemCommande= [[UITabBarItem alloc] initWithTitle:@"Commande"
                                                                    image: [UIImage imageNamed:@"shopping-cart.png"] tag:1];
    commandesViewController.tabBarItem=tabBarItemCommande;
    
    //        VIDEOS
    //       UINavigationController *navigationController2= [[UINavigationController alloc] initWithNibName:@"VideosViewController" bundle:nil];
    
    videosViewController = [[PTPVideosViewController alloc] initWithNibName:@"PTPVideosViewController" bundle:nil];
    
    UITabBarItem *tabBarItemTV= [[UITabBarItem alloc] initWithTitle:@"Videos"
                                                              image: [UIImage imageNamed:@"tv.png"] tag:1];
    videosViewController.tabBarItem=tabBarItemTV;
    
    //        PROFIL
    profilViewController = [[PTPProfilViewController alloc] initWithNibName:@"PTPProfilViewController" bundle:nil];
    UITabBarItem *tabBarItemProfil= [[UITabBarItem alloc] initWithTitle:@"Profil"
                                                                  image: [UIImage imageNamed:@"user.png"] tag:1];
    profilViewController.tabBarItem=tabBarItemProfil;
    
    //        ABOUT
    aboutViewController = [[PTPAboutViewController alloc] initWithNibName:@"PTPAboutViewController" bundle:nil];
    UITabBarItem *tabBarItemAbout= [[UITabBarItem alloc] initWithTitle:@"A Propos"
                                                                 image: [UIImage imageNamed:@"calendar.png"] tag:1];
    aboutViewController.tabBarItem=tabBarItemAbout;
    
    //    } else {
    //        vinsController = [[VinsViewController alloc] initWithNibName:@"VinViewController_iPad" bundle:nil];
    //        coursViewController = [[CoursViewController alloc] initWithNibName:@"CoursViewController_iPad" bundle:nil];
    //    }
    
    
    //    CoursViewController *secondViewController = [[CoursViewController alloc] initWithNibName:@"SecondViewController" bundle:nil];
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:coursViewController];
    navigationController.title = @"Cours";
    [navigationController setNavigationBarHidden:NO];
    
    
    self.tabBarController = [[UITabBarController alloc] init];
    self.tabBarController.viewControllers = @[vinsController, navigationController,commandesViewController,videosViewController,profilViewController,aboutViewController];
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
