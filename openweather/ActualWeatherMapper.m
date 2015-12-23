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

#import "PreferencesManager.h"

@implementation ActualWeatherMapper

+ (ActualWeather *)actualWeatherFromManagedObject:(ActualWeatherManaged *)object {
    ActualWeather *actualWeather = [[ActualWeather alloc] init];
    
    actualWeather.date = object.date;
    actualWeather.cityName = object.cityName;
    actualWeather.weatherCondition = object.weatherCondition;
    actualWeather.weatherIcon = object.icon;
    actualWeather.temperature = [self conversion:object.temperatureValue];
    actualWeather.maxTemperature = [self conversion:object.maxTemperatureValue];
    actualWeather.minTemperature = [self conversion:object.minTemperatureValue];
    
    NSMutableArray *detailWeatherData = [NSMutableArray array];
    
    for (NSString *key in [self detailWeatherSortedKeys]) {
        if ([object valueForKey:key]) {
            NSDictionary *detail = @{DetailWeatherDescriptionKey: [[self detailWeathersKeys] valueForKey:key], DetailWeatherValueKey:[object valueForKey:key]};
            [detailWeatherData addObject:detail];
        }
    }
    
    
    actualWeather.detail = detailWeatherData;
    
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
    forecast.maxTemperature = [self conversion:object.maxTemperatureValue];
    forecast.minTemperature = [self conversion:object.minTemperatureValue];
    forecast.pressure = object.pressureValue;
    forecast.humidity = object.humidityValue;
    
    return forecast;
}


#pragma mark - Private

+ (float)conversion:(float)input {
    if ([PreferencesManager units] == UnitTypeMetric) {
        return [UnitsHelper convertKelvinToCelsius:input];
    }
    
    if ([PreferencesManager units] == UnitTypeImperial) {
        return [UnitsHelper convertKelvinToFahrenheit:input];
    }
    
    return input;
}

+ (NSArray *)detailWeatherSortedKeys {
    return @[@"sunrise", @"sunset", @"humidity", @"pressure", @"cloudiness", @"windSpeed", @"windDirection", @"rain3h", @"snow3h"];
}

+ (NSDictionary *)detailWeathersKeys {
    return @{@"sunrise" : @"Sunrise",
             @"sunset" : @"Sunset",
             @"pressure" : @"Pressure",
             @"humidity" : @"Humidity",
             @"windSpeed" : @"Wind Speed",
             @"windDirection" : @"Wind Direction",
             @"cloudiness" : @"Cloudiness",
             @"rain3h" : @"Rain 3h",
             @"snow3h" : @"Snow 3h"};
}



@end
