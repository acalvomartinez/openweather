//
//  AppDelegate.m
//  openweather
//
//  Created by Toni on 16/12/15.
//  Copyright © 2015 Toni. All rights reserved.
//

#import "AppDelegate.h"
#import "AppDependencies.h"

#import "PreferencesManager.h"

@interface AppDelegate ()

@property (nonatomic, strong) AppDependencies *dependencies;

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [PreferencesManager setUnits:UnitTypeMetric];
    
    AppDependencies *dependencies = [[AppDependencies alloc] init];
    self.dependencies = dependencies;
    
    [self.dependencies installRootViewControllerIntoWindow:self.window];
    
    return YES;
}


@end
