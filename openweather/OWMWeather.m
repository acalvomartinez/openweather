//
//  OWMWeather.m
//  openweather
//
//  Created by Toni on 17/12/15.
//  Copyright © 2015 Toni. All rights reserved.
//

#import "OWMWeather.h"

@implementation OWMWeather

+ (instancetype)weatherWithId:(NSUInteger)weatherId
                        group:(NSString *)group
                    condition:(NSString *)condition
                         icon:(NSString *)icon {
    OWMWeather *weather = [[OWMWeather alloc] init];
    weather.weatherId = weatherId;
    weather.group = group;
    weather.condition = condition;
    weather.icon = icon;
    
    return weather;
}

@end
