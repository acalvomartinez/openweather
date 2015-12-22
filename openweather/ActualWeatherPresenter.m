 //
//  ActualWeatherPresenter.m
//  openweather
//
//  Created by Toni on 21/12/15.
//  Copyright © 2015 Toni. All rights reserved.
//

#import "ActualWeatherPresenter.h"
#import "ActualWeatherViewInterface.h"

@implementation ActualWeatherPresenter

- (void)foundUpActualWeather:(id)actualWeather {
    [self.view updateViewWithActualWeather:actualWeather];
}

- (void)foundUpForecast:(NSArray *)forecast {
    [self.view updateViewWithForecast:forecast];
}

- (void)actualWeatherFailWithError:(NSError *)error {
    NSLog(@"%@",error);
}

- (void)updateView {
    [self.interactor findCurrentLocation];
}

- (void)requestLocationServiceAuthorization {
    [self.interactor requestLocationServiceAuthorization];
}

@end
