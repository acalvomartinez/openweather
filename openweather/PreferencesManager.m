//
//  PreferencesManager.m
//  openweather
//
//  Created by Toni on 22/12/15.
//  Copyright © 2015 Toni. All rights reserved.
//

#import "PreferencesManager.h"

static NSString *PreferencesUnitsKey = @"units";
static NSString *PreferencesForecastDaysKey = @"days";

@interface PreferencesManager ()

@property (nonatomic, assign) UnitType units;
@property (nonatomic, assign) NSInteger forecastDays;

@end

@implementation PreferencesManager

+ (UnitType)units {
    return [[NSUserDefaults standardUserDefaults] integerForKey:PreferencesForecastDaysKey];
}

+ (void)setUnits:(UnitType)units {
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    
    [userDefaults setInteger:units forKey:PreferencesForecastDaysKey];
    [userDefaults synchronize];
}

+ (NSInteger)forecastDays {
    NSInteger days = [[NSUserDefaults standardUserDefaults] integerForKey:PreferencesForecastDaysKey];
    
    if (days == 0) {
        [self setForecastDays:5];
    }
    
    return [[NSUserDefaults standardUserDefaults] integerForKey:PreferencesForecastDaysKey];
}

+ (void)setForecastDays:(NSInteger)forecastDays {
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    
    [userDefaults setInteger:forecastDays forKey:PreferencesForecastDaysKey];
    [userDefaults synchronize];
}

@end
