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

@implementation OWMJSONParser

+ (void)parseActualWeatherJSONString:(NSString *)jsonAsString
                          completion:(ActualForecastParseBlock)completionBlock
                             onError:(ParseErrorBlock)errorBlock {
    NSData *data = [jsonAsString dataUsingEncoding:NSUTF8StringEncoding];
    
    NSError *error;
    NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
    
    if (error) {
        NSMutableDictionary *dict = [NSMutableDictionary dictionary];
        dict[NSLocalizedDescriptionKey] = ParserErrorEmpyJSONDescription;
        dict[NSLocalizedFailureReasonErrorKey] = ParserErrorEmpyJSONReasonError;
        dict[NSUnderlyingErrorKey] = error;
        NSError *parseError = [NSError errorWithDomain:ParserErrorDomain code:ParserErrorEmptyJSONFile userInfo:dict];
        
        if (errorBlock != nil) errorBlock(parseError);
        return;   
    }
    
    if (jsonDictionary.count == 0) {
        
        NSMutableDictionary *dict = [NSMutableDictionary dictionary];
        dict[NSLocalizedDescriptionKey] = ParserErrorEmpyJSONDescription;
        dict[NSLocalizedFailureReasonErrorKey] = ParserErrorEmpyJSONReasonError;
        NSError *parseError = [NSError errorWithDomain:ParserErrorDomain code:ParserErrorEmptyJSONFile userInfo:dict];
        
        if (errorBlock != nil) errorBlock(parseError);
        return;
    }
    
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
    
    OWMActualWeather *actualWeather = [OWMActualWeather actualForecastWithDate:date city:city weather:weatherData sunrise:sunrise sunset:sunset];
    
    if (completionBlock != nil) {
        completionBlock(actualWeather);
    }
}

+ (void)parseForecastJSONString:(NSString *)jsonAsString
                     completion:(ForecastParseBlock)completionBlock
                        onError:(ParseErrorBlock)errorBlock {
    
}


#pragma mark - Private


@end
