//
//  OWMForecast.m
//  openweather
//
//  Created by Toni on 17/12/15.
//  Copyright © 2015 Toni. All rights reserved.
//

#import "OWMForecast.h"

#import "OWMCity.h"
#import "OWMWeather.h"

@implementation OWMForecast

+ (instancetype)forecastWithDate:(NSDate *)date
                            city:(OWMCity *)city
                         weather:(OWMWeather *)weather
                     temperature:(float)temperature
                  maxTemperature:(float)maxTemperature
                  minTemperature:(float)minTemperature
                        pressure:(float)pressure
                        humidity:(float)humidity {
    
    return [[self alloc] initWithDate:date
                                 city:city
                              weather:weather
                          temperature:temperature
                       maxTemperature:maxTemperature
                       minTemperature:minTemperature
                             pressure:pressure
                             humidity:humidity];
}

- (instancetype)initWithDate:(NSDate *)date
                        city:(OWMCity *)city
                     weather:(OWMWeather *)weather
                 temperature:(float)temperature
              maxTemperature:(float)maxTemperature
              minTemperature:(float)minTemperature
                    pressure:(float)pressure
                    humidity:(float)humidity {
    if (self = [super init]) {
        self.date = date;
        self.city = city;
        self.weather = weather;
        self.temperature = temperature;
        self.maxTemperature = temperature;
        self.minTemperature = minTemperature;
        self.pressure = pressure;
        self.humidity = humidity;
    }
    
    return self;

}

@end
