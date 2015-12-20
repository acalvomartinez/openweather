//
//  OWMForecast.m
//  openweather
//
//  Created by Toni on 17/12/15.
//  Copyright © 2015 Toni. All rights reserved.
//

#import "JSONForecast.h"

#import "JSONCity.h"
#import "JSONWeatherData.h"

@implementation JSONForecast

+ (instancetype)forecastWithDate:(NSDate *)date
                         weather:(JSONWeatherData *)weather {
    
    return [[self alloc] initWithDate:date
                              weather:weather];
}

+ (instancetype)forecastFromDictionary:(NSDictionary *)dictionary {
    
    
    return [[self alloc] initWithDate:nil
                              weather:nil];
}

- (instancetype)initWithDate:(NSDate *)date
                     weather:(JSONWeatherData *)weather {
    if (self = [super init]) {
        self.date = date;
        self.weather = weather;
    }
    
    return self;

}

@end
