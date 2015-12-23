//
//  ActualWeather.h
//  openweather
//
//  Created by Toni on 20/12/15.
//  Copyright © 2015 Toni. All rights reserved.
//

#import <Foundation/Foundation.h>

static NSString * const DetailWeatherValueKey = @"value";
static NSString * const DetailWeatherDescriptionKey = @"description";

@class Forecast;

@interface ActualWeather : NSObject

@property (nonatomic, strong) NSDate *date;

@property (nonatomic, copy) NSString *cityName;
@property (nonatomic, copy) NSString *weatherCondition;
@property (nonatomic, copy) NSString *weatherIcon;

@property (nonatomic, assign) float temperature;
@property (nonatomic, assign) float maxTemperature;
@property (nonatomic, assign) float minTemperature;

@property (nonatomic, strong) NSArray <NSDictionary *> *detail;
@property (nonatomic, strong) NSArray <Forecast *> *forecast;

+ (instancetype)blankWeather;

@end
