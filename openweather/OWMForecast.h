//
//  OWMForecast.h
//  openweather
//
//  Created by Toni on 17/12/15.
//  Copyright © 2015 Toni. All rights reserved.
//

#import <Foundation/Foundation.h>

@class OWMWeather;

@interface OWMForecast : NSObject

@property (nonatomic, strong) NSDate *date;
@property (nonatomic, strong) OWMWeather *weather;

@property (nonatomic, assign) float temperature;
@property (nonatomic, assign) float maxTemperature;
@property (nonatomic, assign) float minTemperature;
@property (nonatomic, assign) float pressure;
@property (nonatomic, assign) float humidity;


+ (instancetype)forecastWithDate:(NSDate *)date
                         weather:(OWMWeather *)weather
                     temperature:(float)temperature
                  maxTemperature:(float)maxTemperature
                  minTemperature:(float)minTemperature
                        pressure:(float)pressure
                        humidity:(float)humidity;

- (instancetype)initWithDate:(NSDate *)date
                     weather:(OWMWeather *)weather
                 temperature:(float)temperature
              maxTemperature:(float)maxTemperature
              minTemperature:(float)minTemperature
                    pressure:(float)pressure
                    humidity:(float)humidity;



@end
