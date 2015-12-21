//
//  ActualWeatherManager.h
//  openweather
//
//  Created by Toni on 20/12/15.
//  Copyright © 2015 Toni. All rights reserved.
//

#import <Foundation/Foundation.h>

@import CoreLocation;

@class ActualWeather;
@class Forecast;

typedef void(^ActualWeatherFecthBlock)(ActualWeather * _Nullable);
typedef void(^ForecastFecthBlock)(NSArray <Forecast *> * _Nullable);
typedef void(^ErrorBlock)(NSError * _Nullable);

@interface ActualWeatherDataManager : NSObject

- (void)createActualWeatherManagedOnErrorBlock:(ErrorBlock _Nullable)errorBlock;

- (void)actualWeatherOnCompletionBlock:(ActualWeatherFecthBlock _Nullable)completionBlock
                            errorBlock:(ErrorBlock _Nullable)errorBlock;

- (void)actualWeatherForLocation:(CLLocationCoordinate2D)coordinate
    actualWeatherCompletionBlock:(ActualWeatherFecthBlock _Nullable)actualWeatherCompletionBlock
         forecastCompletionBlock:(ForecastFecthBlock _Nullable)forecastCompletionBlock
                      errorBlock:(ErrorBlock _Nullable)errorBlock;

@end
