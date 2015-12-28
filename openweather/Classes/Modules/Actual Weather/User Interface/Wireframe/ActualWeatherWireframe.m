//
//  ActualWeatherWireframe.m
//  openweather
//
//  Created by Toni on 21/12/15.
//  Copyright © 2015 Toni. All rights reserved.
//

#import "ActualWeatherWireframe.h"
#import "ActualWeatherPresenter.h"
#import "ActualWeatherViewController.h"

static NSString *ActualWeatherViewControllerIdentifier = @"ActualWeatherViewController";

@interface ActualWeatherWireframe ()
@property (nonatomic, strong) ActualWeatherViewController *actualWeatherViewController;
@property (nonatomic, strong) UIWindow *mainWindow;
@end

@implementation ActualWeatherWireframe

- (void)presentActualWeatherInterfaceFromWindow:(UIWindow *)window {
    self.actualWeatherViewController = [self welcomeViewControllerFromStoryboard];
    self.actualWeatherViewController.presenter = self.presenter;
    
    self.presenter.view = self.actualWeatherViewController;
    
    window.rootViewController = self.actualWeatherViewController;
    
    self.mainWindow = window;
}

- (ActualWeatherViewController *)welcomeViewControllerFromStoryboard {
    UIStoryboard *storyboard = [self mainStoryboard];
    ActualWeatherViewController *viewController = [storyboard instantiateViewControllerWithIdentifier:ActualWeatherViewControllerIdentifier];
    
    return viewController;
}

- (UIStoryboard *)mainStoryboard {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main"
                                                         bundle:[NSBundle mainBundle]];
    return storyboard;
}


@end
