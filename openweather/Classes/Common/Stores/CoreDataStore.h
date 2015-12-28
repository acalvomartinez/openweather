//
//  DataStoreManager.h
//  openweather
//
//  Created by Toni on 20/12/15.
//  Copyright © 2015 Toni. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "DataStoreProtocol.h"

@class ActualWeatherManaged;
@class ForecastManaged;
@class JSONActualWeather;
@class JSONForecast;

@interface CoreDataStore : NSObject <DataStoreProtocol>

- (void)updateActualWeatherManaged:(ActualWeatherManaged *)objectManaged
             withJSONActualWeather:(JSONActualWeather *)JSONObject
                           onError:(ActualWeatherErrorBlock)errorBlock;

- (void)updateActualWeatherManaged:(ActualWeatherManaged *)objectManaged
                  withJSONForecast:(NSArray<JSONForecast *> *)JSONObject
                           onError:(ActualWeatherErrorBlock)errorBlock;

- (ForecastManaged *)forecastManagedFromJSONForecast:(JSONForecast *)JSONObject;

@end
