//
//  OWMForecast.h
//  openweather
//
//  Created by Toni on 17/12/15.
//  Copyright © 2015 Toni. All rights reserved.
//

#import <Foundation/Foundation.h>

@class JSONWeatherData;

@interface JSONForecast : NSObject

@property (nonatomic, strong) NSDate *date;
@property (nonatomic, strong) JSONWeatherData *weather;

+ (instancetype)forecastWithDate:(NSDate *)date
                         weather:(JSONWeatherData *)weather;

+ (instancetype)forecastFromDictionary:(NSDictionary *)jsonDictionary;

- (instancetype)initWithDate:(NSDate *)date
                     weather:(JSONWeatherData *)weather;


@end
