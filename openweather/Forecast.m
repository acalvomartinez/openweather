//
//  Forecast.m
//  openweather
//
//  Created by Toni on 20/12/15.
//  Copyright © 2015 Toni. All rights reserved.
//

#import "Forecast.h"

@implementation Forecast

-(NSString *)description {
    return [NSString stringWithFormat:@"%@. Max: %2f. Min: %2f. %@", self.date, self.maxTemperature, self.minTemperature, self.weatherCondition];
}

@end
