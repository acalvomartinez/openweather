//
//  OWMForecast.h
//  openweather
//
//  Created by Toni on 17/12/15.
//  Copyright © 2015 Toni. All rights reserved.
//

#import <Foundation/Foundation.h>

@class OWMWeatherData;

@interface OWMForecast : NSObject

@property (nonatomic, strong) NSDate *date;
@property (nonatomic, strong) OWMWeatherData *weather;

+ (instancetype)forecastWithDate:(NSDate *)date
                         weather:(OWMWeatherData *)weather;

+ (instancetype)forecastFromDictionary:(NSDictionary *)jsonDictionary;

- (instancetype)initWithDate:(NSDate *)date
                     weather:(OWMWeatherData *)weather;


@end
