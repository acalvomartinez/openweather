//
//  ActualWeatherMapper.m
//  openweather
//
//  Created by Toni on 20/12/15.
//  Copyright © 2015 Toni. All rights reserved.
//

#import "ActualWeatherMapper.h"
#import "ActualWeather.h"
#import "ActualWeatherManaged.h"
#import "Forecast.h"
#import "ForecastManaged.h"

@implementation ActualWeatherMapper


+ (ActualWeather *)actualWeatherFromManagedObject:(ActualWeatherManaged *)object {
    ActualWeather *actualWeather = [[ActualWeather alloc] init];
    
    actualWeather.date = object.date;
    actualWeather.cityName = object.cityName;
    actualWeather.weatherCondition = object.weatherCondition;
    actualWeather.weatherIcon = object.icon;
    actualWeather.temperature = object.temperatureValue;
    actualWeather.maxTemperature = object.maxTemperatureValue;
    actualWeather.minTemperature = object.minTemperatureValue;
    actualWeather.pressure = object.pressureValue;
    actualWeather.humidity = object.humidityValue;
    actualWeather.windSpeed = object.windSpeedValue;
    actualWeather.windDirection = object.windDirectionValue;
    actualWeather.cloudiness = object.cloudinessValue;
    actualWeather.rain3h = object.rain3hValue;
    actualWeather.snow3h = object.snow3hValue;
    
    NSMutableArray *actualWeatherForecast = [NSMutableArray arrayWithCapacity:[object.forecast count]];
    
    for (ForecastManaged *forecastManaged in [object sortedForecast]) {
        
        Forecast *forecast = [self forecastFromManagedObject:forecastManaged];
        
        [actualWeatherForecast addObject:forecast];
    }
    
    actualWeather.forecast = actualWeatherForecast;
    
    return actualWeather;
}

+ (Forecast *)forecastFromManagedObject:(ForecastManaged *)object {
    Forecast *forecast = [[Forecast alloc] init];
    
    forecast.date = object.date;
    forecast.weatherCondition = object.weatherCondition;
    forecast.weatherIcon = object.icon;
    forecast.maxTemperature = object.maxTemperatureValue;
    forecast.minTemperature = object.minTemperatureValue;
    forecast.pressure = object.pressureValue;
    forecast.humidity = object.humidityValue;
    
    return forecast;
}

@end
