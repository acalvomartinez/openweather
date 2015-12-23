//
//  UnitsHelper.h
//  openweather
//
//  Created by Toni on 22/12/15.
//  Copyright © 2015 Toni. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    UnitTypeImperial,
    UnitTypeMetric
} UnitType;

@interface UnitsHelper : NSObject

+ (float)convertKelvinToCelsius:(float)kelvin;
+ (float)convertKelvinToFahrenheit:(float)kelvin;

+ (NSString *)windDirectionUnitsIn:(UnitType)unit;

@end
