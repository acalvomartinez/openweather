//
//  OWMJSONParameters.h
//  openweather
//
//  Created by Toni on 17/12/15.
//  Copyright © 2015 Toni. All rights reserved.
//

#import <Foundation/Foundation.h>

static NSString * const cityIdentifier = @"city";
static NSString * const cityIdIdentifier = @"id";
static NSString * const cityNameIdentifier = @"name";

static NSString * const weatherIdIdentifier = @"weather.id";
static NSString * const weatherGroupIdentifier = @"weather.group";
static NSString * const weatherConditionIdentifier = @"weather.description";
static NSString * const weatherIconIdentifier = @"weather.icon";

static NSString * const dateIdentifier = @"dt";

static NSString * const temperatureIdentifier = @"main.temp";
static NSString * const maxTemperatureIdentifier = @"main.temp_min";
static NSString * const minTemperatureIdentifier = @"main.temp_max";
static NSString * const pressureIdentifier = @"main.pressure";
static NSString * const humidityIdentifier = @"main.humidity";

static NSString * const windIdentifier = @"wind";
static NSString * const windSpeedIdentifier = @"win.speed";
static NSString * const windDegIdentifier = @"win.deg";

static NSString * const cloudinessIdentifier = @"cloud.all";
static NSString * const rain3hIdentifier = @"rain.3h";
static NSString * const sunriseIdentifier = @"sys.sunrise";
static NSString * const sunsetIdentifier = @"sys.sunset";