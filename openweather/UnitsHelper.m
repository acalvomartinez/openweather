//
//  UnitsHelper.m
//  openweather
//
//  Created by Toni on 22/12/15.
//  Copyright © 2015 Toni. All rights reserved.
//

#import "UnitsHelper.h"

@implementation UnitsHelper

+ (float)convertKelvinToCelsius:(float)kelvin {
    return kelvin - 273.15;
}

+ (float)convertKelvinToFahrenheit:(float)kelvin {
    return kelvin * 9/5 - 459.67;
}

@end
