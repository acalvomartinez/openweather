//
//  AppDependencies.m
//  openweather
//
//  Created by Toni on 20/12/15.
//  Copyright © 2015 Toni. All rights reserved.
//

#import "AppDependencies.h"

#import "ActualWeatherPresenter.h"
#import "ActualWeatherViewController.h"
#import "ActualWeatherInteractor.h"
#import "ActualWeatherWireframe.h"
#import "ActualWeatherDataManager.h"

@interface AppDependencies ()

@property (nonatomic, strong) ActualWeatherWireframe *actualWeatherWireframe;

@end

@implementation AppDependencies

- (id)init
{
    if ((self = [super init]))
    {
        [self configureDependencies];
    }
    
    return self;
}


- (void)installRootViewControllerIntoWindow:(UIWindow *)window {
    
    [self.actualWeatherWireframe presentActualWeatherInterfaceFromWindow:window];
}

- (void)configureDependencies
{
    ActualWeatherWireframe *actualWeatherWireframe = [[ActualWeatherWireframe alloc] init];
    ActualWeatherPresenter *actualWeatherPresenter = [[ActualWeatherPresenter alloc] init];
    ActualWeatherDataManager *actualWeatherDataManager = [[ActualWeatherDataManager alloc] init];
    ActualWeatherInteractor *actualWeatherInteractor = [[ActualWeatherInteractor alloc] initWithDataManager:actualWeatherDataManager];
    
    actualWeatherInteractor.output = actualWeatherPresenter;
    actualWeatherPresenter.interactor = actualWeatherInteractor;
    actualWeatherPresenter.wireframe = actualWeatherWireframe;
    actualWeatherWireframe.presenter = actualWeatherPresenter;
    
    self.actualWeatherWireframe = actualWeatherWireframe;
}

@end
