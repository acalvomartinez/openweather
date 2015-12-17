//
//  OWMWeather.h
//  openweather
//
//  Created by Toni on 17/12/15.
//  Copyright © 2015 Toni. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OWMWeatherData : NSObject

@property (nonatomic, assign) NSUInteger weatherId;
@property (nonatomic, copy) NSString *group;
@property (nonatomic, copy) NSString *condition;
@property (nonatomic, copy) NSString *icon;

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



+ (instancetype)weatherWithId:(NSUInteger)weatherId
                        group:(NSString *)group
                    condition:(NSString *)condition
                         icon:(NSString *)icon
                  temperature:(float)temperature
               maxTemperature:(float)maxTemperature
               minTemperature:(float)minTemperature
                     pressure:(float)pressure
                     humidity:(float)humidity
                    windSpeed:(float)windSpeed
                windDirection:(float)windDirection
                   cloudiness:(float)cloudiness
                       rain3h:(float)rain3h
                       snow3h:(float)snow3h;

+ (instancetype)weatherWithId:(NSUInteger)weatherId
                        group:(NSString *)group
                    condition:(NSString *)condition
                         icon:(NSString *)icon
                  temperature:(float)temperature
               maxTemperature:(float)maxTemperature
               minTemperature:(float)minTemperature
                     pressure:(float)pressure
                     humidity:(float)humidity
                    windSpeed:(float)windSpeed
                windDirection:(float)windDirection
                   cloudiness:(float)cloudiness;

- (instancetype)initWithId:(NSUInteger)weatherId
                     group:(NSString *)group
                 condition:(NSString *)condition
                      icon:(NSString *)icon
               temperature:(float)temperature
            maxTemperature:(float)maxTemperature
            minTemperature:(float)minTemperature
                  pressure:(float)pressure
                  humidity:(float)humidity
                 windSpeed:(float)windSpeed
             windDirection:(float)windDirection
                cloudiness:(float)cloudiness
                    rain3h:(float)rain3h
                    snow3h:(float)snow3h;

@end
