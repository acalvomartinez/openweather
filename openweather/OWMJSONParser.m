//
//  OWMJSONParser.m
//  openweather
//
//  Created by Toni on 17/12/15.
//  Copyright © 2015 Toni. All rights reserved.
//

#import "OWMJSONParser.h"
#import "OWMJSONParserErrors.h"
#import "OWMJSONIdentifiers.h"

#import "OWMCity.h"
#import "OWMWeatherData.h"
#import "OWMForecast.h"
#import "OWMActualWeather.h"

#import "NSError+OWMErrors.h"

@implementation OWMJSONParser

+ (void)parseActualWeatherJSONString:(NSString *)jsonAsString
                          completion:(ActualForecastParseBlock)completionBlock
                             onError:(ParseErrorBlock)errorBlock {
    NSData *data = [jsonAsString dataUsingEncoding:NSUTF8StringEncoding];
    
    NSError *error;
    NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
    
    if (error) {
        NSError *parseError = [NSError errorWithDescription:ParserErrorEmptyJSONDescription
                                                     reason:ParserErrorEmptyJSONReasonError
                                                     domain:ParserErrorDomain
                                                       code:ParserErrorEmptyJSONFile
                                                parentError:error];
        
        if (errorBlock != nil) errorBlock(parseError);
        return;   
    }
    
    if (jsonDictionary.count == 0) {
        
        NSError *parseError = [NSError errorWithDescription:ParserErrorEmptyJSONDescription
                                                     reason:ParserErrorEmptyJSONReasonError
                                                     domain:ParserErrorDomain
                                                       code:ParserErrorEmptyJSONFile
                                                parentError:nil];
        if (errorBlock != nil) errorBlock(parseError);
        return;
    }
    
    OWMActualWeather *actualWeather = [self actualWeatherFromDictionary:jsonDictionary];
    
    if (completionBlock != nil) {
        completionBlock(actualWeather);
    }
}

+ (void)parseForecastJSONString:(NSString *)jsonAsString
                     completion:(ForecastParseBlock)completionBlock
                        onError:(ParseErrorBlock)errorBlock {
    NSData *data = [jsonAsString dataUsingEncoding:NSUTF8StringEncoding];
    
    NSError *error;
    NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
    
    if (error) {
        NSError *parseError = [NSError errorWithDescription:ParserErrorEmptyJSONDescription
                                                     reason:ParserErrorEmptyJSONReasonError
                                                     domain:ParserErrorDomain
                                                       code:ParserErrorEmptyJSONFile
                                                parentError:error];
        if (errorBlock != nil) errorBlock(parseError);
        return;
    }
    
    if (jsonDictionary.count == 0) {
        
        NSError *parseError = [NSError errorWithDescription:ParserErrorEmptyJSONDescription
                                                     reason:ParserErrorEmptyJSONReasonError
                                                     domain:ParserErrorDomain
                                                       code:ParserErrorEmptyJSONFile
                                                parentError:nil];
        if (errorBlock != nil) errorBlock(parseError);
        return;
    }
    
    NSArray *jsonForecastArray = [jsonDictionary objectForKey:listIdentifier];
    
    if (jsonForecastArray==nil || jsonForecastArray.count == 0) {
        
        NSError *parseError = [NSError errorWithDescription:ParserErrorNoForecastDataDescription
                                                     reason:ParserErrorNoForecastDataReasonError
                                                     domain:ParserErrorDomain
                                                       code:ParserErrorEmptyJSONFile
                                                parentError:nil];
        
        if (errorBlock != nil) errorBlock(parseError);
        return;
    }
    
    NSMutableArray *forecastArray = [NSMutableArray arrayWithCapacity:jsonForecastArray.count];
    
    for (NSDictionary *forecastDictionary in jsonForecastArray) {
        
        OWMForecast *forecast = [self forecastFromDictionary:forecastDictionary];
        
        [forecastArray addObject:forecast];
    }
    
    if (completionBlock != nil) {
        completionBlock(forecastArray);
    }
}

#pragma mark - Private



+ (OWMActualWeather *)actualWeatherFromDictionary:(NSDictionary *)jsonDictionary {
    
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:[[jsonDictionary objectForKey:dateIdentifier] integerValue]];
    
    // Weather Data
    
    NSDictionary *weatherDictionary = [[jsonDictionary objectForKey:weatherIdentifier] firstObject];
    NSInteger weatherId = [[weatherDictionary objectForKey:weatherIdIdentifier] integerValue];
    NSString *weatherGroup = [weatherDictionary objectForKey:weatherGroupIdentifier];
    NSString *weatherCodition = [weatherDictionary objectForKey:weatherConditionIdentifier];
    NSString *weatherIcon = [weatherDictionary objectForKey:weatherIconIdentifier];
    
    NSDictionary *mainDataDictionary = [jsonDictionary objectForKey:mainIdentifier];
    float temperature = [[mainDataDictionary objectForKey:temperatureIdentifier] floatValue];
    float maxTemperature = [[mainDataDictionary objectForKey:maxTemperatureIdentifier] floatValue];
    float minTemperature = [[mainDataDictionary objectForKey:minTemperatureIdentifier] floatValue];
    float pressure = [[mainDataDictionary objectForKey:pressureIdentifier] floatValue];
    float humidity = [[mainDataDictionary objectForKey:humidityIdentifier] floatValue];
    
    NSDictionary *windDictionary = [jsonDictionary objectForKey:windIdentifier];
    float windSpeed = [[windDictionary objectForKey:windSpeedIdentifier] floatValue];
    float windDirection = [[windDictionary objectForKey:windDirectionIdentifier] floatValue];
    
    NSDictionary *cloudDictionary = [jsonDictionary objectForKey:cloudIdentifier];
    float cloudiness = [[cloudDictionary objectForKey:cloudinessIdentifier] floatValue];
    
    NSDictionary *rainDictionary = [jsonDictionary objectForKey:rainIdentifier];
    float rain3h = [[rainDictionary objectForKey:rain3hIdentifier] floatValue];
    
    NSDictionary *snowDictionary = [jsonDictionary objectForKey:snowIdentifier];
    float snow3h = [[snowDictionary objectForKey:snow3hIdentifier] floatValue];
    
    OWMWeatherData *weatherData = [OWMWeatherData weatherWithId:weatherId group:weatherGroup condition:weatherCodition icon:weatherIcon temperature:temperature maxTemperature:maxTemperature minTemperature:minTemperature pressure:pressure humidity:humidity windSpeed:windSpeed windDirection:windDirection cloudiness:cloudiness rain3h:rain3h snow3h:snow3h];
    
    // City
    
    OWMCity *city = [OWMCity cityWithId:[[jsonDictionary objectForKey:cityIdIdentifier] integerValue]
                                   name:[jsonDictionary objectForKey:cityNameIdentifier]];
    // Time
    
    NSDictionary *sysDictionary = [jsonDictionary objectForKey:sysIdentifier];
    NSDate *sunrise = [NSDate dateWithTimeIntervalSince1970:[[sysDictionary objectForKey:sunriseIdentifier] integerValue]];
    NSDate *sunset = [NSDate dateWithTimeIntervalSince1970:[[sysDictionary objectForKey:sunsetIdentifier] integerValue]];
    
    return [OWMActualWeather actualWeatherWithDate:date city:city weather:weatherData sunrise:sunrise sunset:sunset];
}

+ (OWMForecast *)forecastFromDictionary:(NSDictionary *)jsonDictionary {
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:[[jsonDictionary objectForKey:dateIdentifier] integerValue]];
    
    // Weather Data
    
    NSDictionary *weatherDictionary = [[jsonDictionary objectForKey:weatherIdentifier] firstObject];
    NSInteger weatherId = [[weatherDictionary objectForKey:weatherIdIdentifier] integerValue];
    NSString *weatherGroup = [weatherDictionary objectForKey:weatherGroupIdentifier];
    NSString *weatherCodition = [weatherDictionary objectForKey:weatherConditionIdentifier];
    NSString *weatherIcon = [weatherDictionary objectForKey:weatherIconIdentifier];
    
    NSDictionary *tempDictionary = [jsonDictionary objectForKey:temperatureIdentifier];
    float temperature = [[tempDictionary objectForKey:dayIdentifier] floatValue];
    float maxTemperature = [[tempDictionary objectForKey:maxIdentifier] floatValue];
    float minTemperature = [[tempDictionary objectForKey:minIdentifier] floatValue];
    
    float pressure = [[jsonDictionary objectForKey:pressureIdentifier] floatValue];
    float humidity = [[jsonDictionary objectForKey:humidityIdentifier] floatValue];
    float windSpeed = [[jsonDictionary objectForKey:windSpeedIdentifier] floatValue];
    float windDirection = [[jsonDictionary objectForKey:windDirectionIdentifier] floatValue];
    
    float cloudiness = [[jsonDictionary objectForKey:cloudIdentifier] floatValue];
    
    OWMWeatherData *weatherData = [OWMWeatherData weatherWithId:weatherId group:weatherGroup condition:weatherCodition icon:weatherIcon temperature:temperature maxTemperature:maxTemperature minTemperature:minTemperature pressure:pressure humidity:humidity windSpeed:windSpeed windDirection:windDirection cloudiness:cloudiness];
    
    return [OWMForecast forecastWithDate:date weather:weatherData];
}

@end
