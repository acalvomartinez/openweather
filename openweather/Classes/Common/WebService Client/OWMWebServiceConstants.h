//
//  OWMWebServiceConstants.h
//  openweather
//
//  Created by Toni on 18/12/15.
//  Copyright © 2015 Toni. All rights reserved.
//

static NSString * const OpenWeatherMapAPIKey = @"75191f5518321ac6db4e4a5821a02e24";
static NSString * const OpenWeatherMapBaseURL = @"http://api.openweathermap.org/data/2.5/";

static NSUInteger const OpenWeatherNetworkingRetries = 5;

static NSString * const OpenWeatherMapActualWeatherPath= @"weather";
static NSString * const OpenWeatherMapForecastPath= @"forecast/daily";

static NSString * const OpenWeatherAPIKeyParameter = @"APPID";
static NSString * const OpenWeatherMapDaysParameter = @"cnt";
static NSString * const OpenWeatherMapLatParameter = @"lat";
static NSString * const OpenWeatherMapLonParameter = @"lon";

static NSString * const OpenWeatherMapUnitsParameter = @"units";
static NSString * const OpenWeatherMapUnitMetrics = @"metrics";
static NSString * const OpenWeatherMapUnitImperial = @"imperial";