//
//  ActualWeatherViewInterface.h
//  openweather
//
//  Created by Toni on 21/12/15.
//  Copyright © 2015 Toni. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ActualWeatherViewInterface <NSObject>

- (void)updateViewWithActualWeather:(id)actualWeather;
- (void)updateViewWithForecast:(NSArray *)forecast;

@end
