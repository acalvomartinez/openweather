//
//  OWMActualWeather.m
//  openweather
//
//  Created by Toni on 17/12/15.
//  Copyright © 2015 Toni. All rights reserved.
//

#import "OWMActualWeather.h"

@implementation OWMActualWeather

+ (instancetype)actualForecastWithDate:(NSDate *)date
                                  city:(OWMCity *)city
                               weather:(OWMWeatherData *)weather
                               sunrise:(NSDate *)sunrise
                                sunset:(NSDate *)sunset {
    
    return [[self alloc] initWithDate:date
                                 city:city
                              weather:weather
                              sunrise:sunrise
                               sunset:sunset];
}

- (instancetype)initWithDate:(NSDate *)date
                        city:(OWMCity *)city
                     weather:(OWMWeatherData *)weather
                     sunrise:(NSDate *)sunrise
                      sunset:(NSDate *)sunset {
    
    if (self=[super initWithDate:date
                         weather:weather]) {
        
        self.city = city;
        self.sunrise = sunrise;
        self.sunset = sunset;
        
    }
    return self;
}

@end
