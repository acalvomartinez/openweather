//
//  OWMActualWeather.m
//  openweather
//
//  Created by Toni on 17/12/15.
//  Copyright © 2015 Toni. All rights reserved.
//

#import "OWMActualForecast.h"

@implementation OWMActualForecast

+ (instancetype)actualForecastWithDate:(NSDate *)date
                                  city:(OWMCity *)city
                               weather:(OWMWeather *)weather
                           temperature:(float)temperature
                        maxTemperature:(float)maxTemperature
                        minTemperature:(float)minTemperature
                              pressure:(float)pressure
                              humidity:(float)humidity
                             windSpeed:(float)windSpeed
                         windDirection:(float)windDirection
                            cloudiness:(float)cloudiness
                                rain3h:(float)rain3h
                                snow3h:(float)snow3h
                               sunrise:(NSDate *)sunrise
                                sunset:(NSDate *)sunset {
    
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
                    humidity:(float)humidity
                   windSpeed:(float)windSpeed
               windDirection:(float)windDirection
                  cloudiness:(float)cloudiness
                      rain3h:(float)rain3h
                      snow3h:(float)snow3h
                     sunrise:(NSDate *)sunrise
                      sunset:(NSDate *)sunset {
    
    if (self=[super initWithDate:date
                            city:city
                         weather:weather
                     temperature:temperature
                  maxTemperature:maxTemperature
                  minTemperature:minTemperature
                        pressure:pressure
                        humidity:humidity]) {
        
        self.windSpeed = windSpeed;
        self.windDirection = windDirection;
        self.cloudiness = cloudiness;
        self.rain3h = rain3h;
        self.snow3h = snow3h;
        self.sunrise = sunrise;
        self.sunset = sunset;
        
    }
    return self;
}

@end
