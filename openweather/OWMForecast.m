//
//  OWMForecast.m
//  openweather
//
//  Created by Toni on 17/12/15.
//  Copyright © 2015 Toni. All rights reserved.
//

#import "OWMForecast.h"

#import "OWMCity.h"
#import "OWMWeatherData.h"

@implementation OWMForecast

+ (instancetype)forecastWithDate:(NSDate *)date
                         weather:(OWMWeatherData *)weather {
    
    return [[self alloc] initWithDate:date
                              weather:weather];
}

- (instancetype)initWithDate:(NSDate *)date
                     weather:(OWMWeatherData *)weather {
    if (self = [super init]) {
        self.date = date;
        self.weather = weather;
    }
    
    return self;

}

@end
