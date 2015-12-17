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

@interface OWMActualForecast : OWMForecast

@property (nonatomic, strong) OWMCity *city;
@property (nonatomic, assign) float windSpeed;
@property (nonatomic, assign) float windDirection;
@property (nonatomic, assign) float cloudiness;
@property (nonatomic, assign) float rain3h;
@property (nonatomic, assign) float snow3h;
@property (nonatomic, strong) NSDate *sunrise;
@property (nonatomic, strong) NSDate *sunset;

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
                                sunset:(NSDate *)sunset;

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
                      sunset:(NSDate *)sunset

@end
