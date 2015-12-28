#import "_ActualWeatherManaged.h"

@class JSONActualWeather;
@class JSONForecast;

@interface ActualWeatherManaged : _ActualWeatherManaged {}

- (NSArray *)sortedForecast;

@end
