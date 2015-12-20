//
//  OWMActualWeather.h
//  openweather
//
//  Created by Toni on 17/12/15.
//  Copyright © 2015 Toni. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "JSONForecast.h"

@class JSONCity;

@interface JSONActualWeather : JSONForecast

@property (nonatomic, strong) JSONCity *city;

@property (nonatomic, strong) NSDate *sunrise;
@property (nonatomic, strong) NSDate *sunset;

+ (instancetype)actualWeatherWithDate:(NSDate *)date
                                  city:(JSONCity *)city
                               weather:(JSONWeatherData *)weather
                               sunrise:(NSDate *)sunrise
                                sunset:(NSDate *)sunset;

- (instancetype)initWithDate:(NSDate *)date
                        city:(JSONCity *)city
                     weather:(JSONWeatherData *)weather
                     sunrise:(NSDate *)sunrise
                      sunset:(NSDate *)sunset;

@end
