//
//  ActualWeatherTableManager.h
//  openweather
//
//  Created by Toni on 21/12/15.
//  Copyright © 2015 Toni. All rights reserved.
//

#import <Foundation/Foundation.h>
@import UIKit;

@class ActualWeatherViewController;

@interface ActualWeatherTableManager : NSObject

- (instancetype)initWithViewController:(ActualWeatherViewController *)view tableView:(UITableView *)tableView;

- (void)updateActualWeather:(id)actualWeather;
- (void)updateForecast:(NSArray *)forecast;

@end
