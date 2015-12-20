//
//  ActualWeather.m
//  openweather
//
//  Created by Toni on 20/12/15.
//  Copyright © 2015 Toni. All rights reserved.
//

#import "ActualWeather.h"

@implementation ActualWeather

+ (instancetype)blankWeather {
    ActualWeather *blankWeather = [[ActualWeather alloc] init];
    
    blankWeather.cityName = @"Location";
    blankWeather.weatherIcon = @"blank";
    blankWeather.weatherCondition = @"Weather Condition";
    
    return blankWeather;
}

@end
