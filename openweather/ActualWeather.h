//
//  ActualWeather.h
//  openweather
//
//  Created by Toni on 20/12/15.
//  Copyright © 2015 Toni. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Forecast;

@interface ActualWeather : NSObject

@property (nonatomic, strong) NSDate *date;

@property (nonatomic, copy) NSString *weatherGroup;
@property (nonatomic, copy) NSString *weatherCondition;
@property (nonatomic, copy) NSString *weatherIcon;

@property (nonatomic, assign) float temperature;
@property (nonatomic, assign) float maxTemperature;
@property (nonatomic, assign) float minTemperature;
@property (nonatomic, assign) float pressure;
@property (nonatomic, assign) float humidity;

@property (nonatomic, assign) float windSpeed;
@property (nonatomic, assign) float windDirection;
@property (nonatomic, assign) float cloudiness;
@property (nonatomic, assign) float rain3h;
@property (nonatomic, assign) float snow3h;

@property (nonatomic, strong) NSArray <Forecast *> *forecast;

@end
