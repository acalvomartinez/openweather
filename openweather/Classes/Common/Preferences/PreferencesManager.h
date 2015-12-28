//
//  PreferencesManager.h
//  openweather
//
//  Created by Toni on 22/12/15.
//  Copyright © 2015 Toni. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "UnitsHelper.h"

@interface PreferencesManager : NSObject

+ (UnitType)units;
+ (void)setUnits:(UnitType)units;

+ (NSInteger)forecastDays;
+ (void)setForecastDays:(NSInteger)forecastDays;

@end
