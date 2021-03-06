//
//  AppDelegate.m
//  AppotaSDKMultipleScreenTest
//
//  Created by tuent on 11/14/13.
//  Copyright (c) 2013 Appota. All rights reserved.
//

#import "AppDelegate.h"

#import "AdsViewController.h"


#define CLIENT_ID           @"e8a1ffd03bfe5d401d875df633cd43eb051f0a4fc"
#define CLIENT_SECRET       @"060f9c20e5259e2462f1cc00c15c6f93051f0a4fc"
#define INAPP_API_KEY       @"1e1aa54ce3c646d8f6456558434d9475051f74156"

/*
 * SANDBOX_ID will be used when app's not been published yet
 */
#define SANDBOX_CLIENT_ID @"SANDBOX_CLIENT_ID"
#define SANDBOX_CLIENT_SECRET @"SANDBOX_CLIENT_SECRET"
#define SANDBOX_INAPP_API_KEY @"SANDBOX_INAPP_API_KEY"


@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.navController = [[UINavigationController alloc] init];
    self.navController.navigationBarHidden = YES;
    AdsViewController* viewController = [[AdsViewController alloc] initWithNibName:@"AdsViewController" bundle:nil];
    [self.navController pushViewController:viewController animated:YES];
    self.window.rootViewController = self.navController;
    [self.window makeKeyAndVisible];
    [self configGameSDK];
    return YES;
}

- (void) configGameSDK {
    
    [AppotaGameSDKConfigure configureWithClientID:CLIENT_ID
                                 withClientSecret:CLIENT_SECRET
                                  withInAppAPIKey:INAPP_API_KEY
                                        withState:@""
                                    withNoticeUrl:@"http://filestore9.com/test.php"
                                    withConfigUrl:@"http://filestore9.com/config.php"
     ];
#warning Set up auto show payment button and login dialog here, by default autoShowPaymentButton and autoShowLoginDialog are YES
    [AppotaGameSDKConfigure sharedGameConfig].autoShowPaymentButton = NO;
    [AppotaGameSDKConfigure sharedGameConfig].autoShowLoginDialog = NO;
    
    [AppotaGameSDKConfigure sharedGameConfig].googleClientId = @"242204253141.apps.googleusercontent.com";
    
    [AppotaGameSDKConfigure sharedGameConfig].delegate = self;
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

#pragma mark - Gameconfig delegate
/*
 * Implement your verification here
 */
- (void) didFinishLogin:(NSDictionary *)userInfoDict {
#warning Insert your verify action here
    NSLog(@"Login token %@: Username:%@ UserID: %@", [AppotaGameSDKConfigure getAccessToken], [AppotaGameSDKConfigure getUserName], [AppotaGameSDKConfigure getUserID]);
    
}

- (void) didLogOut:(NSString *)userName {
    NSLog(@"Logout %@", userName);
}

- (void) didFinishPaymentWithDictionary:(NSDictionary *)paymentDict withState:(AppotaPaymentState)status withError:(NSError *)error {
    NSLog(@"Payment result");
}

#warning Insert your handle open URL here
- (BOOL) application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation {
    return [AppotaGameSDKConfigure handleOpenURL:url sourceApplication:sourceApplication annotation:annotation];
}

@end
