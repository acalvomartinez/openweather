//
//  ActualWeatherMapper.h
//  openweather
//
//  Created by Toni on 20/12/15.
//  Copyright © 2015 Toni. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ActualWeather;
@class ActualWeatherManaged;

@class Forecast;
@class ForecastManaged;

@interface ActualWeatherMapper : NSObject

+ (ActualWeather *)actualWeatherFromManagedObject:(ActualWeatherManaged *)object;

+ (Forecast *)forecastFromManagedObject:(ForecastManaged *)object;

@end
