//
//  OWMWeather.m
//  openweather
//
//  Created by Toni on 17/12/15.
//  Copyright © 2015 Toni. All rights reserved.
//

#import "JSONWeatherData.h"

@implementation JSONWeatherData

+ (instancetype)weatherWithId:(NSUInteger)weatherId
                        group:(NSString *)group
                    condition:(NSString *)condition
                         icon:(NSString *)icon
                  temperature:(float)temperature
               maxTemperature:(float)maxTemperature
               minTemperature:(float)minTemperature
                     pressure:(float)pressure
                     humidity:(float)humidity
                    windSpeed:(float)windSpeed
                windDirection:(float)windDirection
                   cloudiness:(float)cloudiness
                       rain3h:(float)rain3h
                       snow3h:(float)snow3h {
    return [[self alloc] initWithId:weatherId group:group condition:condition icon:icon temperature:temperature maxTemperature:maxTemperature minTemperature:minTemperature pressure:pressure humidity:humidity windSpeed:windSpeed windDirection:windDirection cloudiness:cloudiness rain3h:rain3h snow3h:snow3h];
}

+ (instancetype)weatherWithId:(NSUInteger)weatherId
                        group:(NSString *)group
                    condition:(NSString *)condition
                         icon:(NSString *)icon
                  temperature:(float)temperature
               maxTemperature:(float)maxTemperature
               minTemperature:(float)minTemperature
                     pressure:(float)pressure
                     humidity:(float)humidity
                    windSpeed:(float)windSpeed
                windDirection:(float)windDirection
                   cloudiness:(float)cloudiness
                       {
    return [[self alloc] initWithId:weatherId group:group condition:condition icon:icon temperature:temperature maxTemperature:maxTemperature minTemperature:minTemperature pressure:pressure humidity:humidity windSpeed:windSpeed windDirection:windDirection cloudiness:cloudiness rain3h:0 snow3h:0];
}


- (instancetype)initWithId:(NSUInteger)weatherId
                     group:(NSString *)group
                 condition:(NSString *)condition
                      icon:(NSString *)icon
               temperature:(float)temperature
            maxTemperature:(float)maxTemperature
            minTemperature:(float)minTemperature
                  pressure:(float)pressure
                  humidity:(float)humidity
                 windSpeed:(float)windSpeed
             windDirection:(float)windDirection
                cloudiness:(float)cloudiness
                    rain3h:(float)rain3h
                    snow3h:(float)snow3h {
    if (self = [super init]) {
        self.weatherId = weatherId;
        self.group = group;
        self.condition = condition;
        self.icon = icon;
        self.temperature = temperature;
        self.maxTemperature = maxTemperature;
        self.minTemperature = minTemperature;
        self.pressure = pressure;
        self.humidity = humidity;
        self.windSpeed = windSpeed;
        self.windDirection = windDirection;
        self.cloudiness = cloudiness;
        self.rain3h = rain3h;
        self.snow3h = snow3h;
    }
    
    return self;
}

@end
