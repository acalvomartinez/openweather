//
//  ActualWeatherTableManager.h
//  openweather
//
//  Created by Toni on 21/12/15.
//  Copyright © 2015 Toni. All rights reserved.
//

#import <Foundation/Foundation.h>

@import UIKit;

@class ActualWeather;
@class Forecast;

@protocol ActualWeatherTableManagerDelegate <NSObject>

- (void)updateHeaderWithValue:(CGFloat)value;

@end

@interface ActualWeatherTableManager : NSObject

- (instancetype)initWithTableView:(UITableView *)tableView andDelegate:(id <ActualWeatherTableManagerDelegate>)delegate;

- (void)updateActualWeather:(ActualWeather *)actualWeather;
- (void)updateForecast:(NSArray <Forecast *> *)forecast;

@end
