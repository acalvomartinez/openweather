#import "_ActualWeatherManaged.h"

@class JSONActualWeather;
@class JSONForecast;

@interface ActualWeatherManaged : _ActualWeatherManaged {}

- (NSArray *)sortedForecast;

- (void)updateWithJSONActualWeather:(JSONActualWeather *)actualWeatherJSON;
- (void)updateWithJSONForecast:(NSArray<JSONForecast *> *)forecastJSON;

@end
