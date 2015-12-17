//
//  OWMActualWeather.h
//  openweather
//
//  Created by Toni on 17/12/15.
//  Copyright © 2015 Toni. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "OWMForecast.h"

@class OWMCity;

@interface OWMActualWeather : OWMForecast

@property (nonatomic, strong) OWMCity *city;

@property (nonatomic, strong) NSDate *sunrise;
@property (nonatomic, strong) NSDate *sunset;

+ (instancetype)actualForecastWithDate:(NSDate *)date
                                  city:(OWMCity *)city
                               weather:(OWMWeatherData *)weather
                               sunrise:(NSDate *)sunrise
                                sunset:(NSDate *)sunset;

- (instancetype)initWithDate:(NSDate *)date
                        city:(OWMCity *)city
                     weather:(OWMWeatherData *)weather
                     sunrise:(NSDate *)sunrise
                      sunset:(NSDate *)sunset;

@end
