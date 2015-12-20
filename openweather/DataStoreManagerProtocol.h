//
//  DataStoreManagerInterface.h
//  openweather
//
//  Created by Toni on 20/12/15.
//  Copyright © 2015 Toni. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^ActualWeatherCompletionBlock)(id);
typedef void(^ActualWeatherErrorBlock)(NSError *);

@protocol DataStoreManagerProtocol <NSObject>

- (id)updateActualWeatherWith:(id)actualWeather andForecast:(NSArray *)forecast;

- (void)fecthActualWeatherWithCompletion:(ActualWeatherCompletionBlock)completionBlock
                                   error:(ActualWeatherErrorBlock)errorBlock;

- (void)saveOnError:(ActualWeatherErrorBlock)errorBlock;

@end
