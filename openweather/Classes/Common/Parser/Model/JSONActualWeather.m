//
//  OWMActualWeather.m
//  openweather
//
//  Created by Toni on 17/12/15.
//  Copyright © 2015 Toni. All rights reserved.
//

#import "JSONActualWeather.h"

@implementation JSONActualWeather

+ (instancetype)actualWeatherWithDate:(NSDate *)date
                                  city:(JSONCity *)city
                               weather:(JSONWeatherData *)weather
                               sunrise:(NSDate *)sunrise
                                sunset:(NSDate *)sunset {
    
    return [[self alloc] initWithDate:date
                                 city:city
                              weather:weather
                              sunrise:sunrise
                               sunset:sunset];
}

- (instancetype)initWithDate:(NSDate *)date
                        city:(JSONCity *)city
                     weather:(JSONWeatherData *)weather
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
