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
    
    blankWeather.cityName = @"";
    blankWeather.weatherIcon = @"";
    blankWeather.weatherCondition = @"";
    
    return blankWeather;
}

-(NSString *)description {
    return [NSString stringWithFormat:@"%@. Temp: %2f. %@", self.cityName, self.temperature, self.weatherCondition];
}

@end
