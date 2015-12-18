//
//  OWMJSONParser.h
//  openweather
//
//  Created by Toni on 17/12/15.
//  Copyright © 2015 Toni. All rights reserved.
//

#import <Foundation/Foundation.h>

@class OWMActualWeather;
@class OWMForecast;

typedef void(^ActualForecastParseBlock)(OWMActualWeather *);
typedef void(^ForecastParseBlock)(NSArray <OWMForecast *> *);
typedef void(^ParseErrorBlock)(NSError *);

@interface OWMJSONParser : NSObject

+ (void)parseActualWeatherJSONString:(NSString *)jsonAsString
                          completion:(ActualForecastParseBlock)completionBlock
                             onError:(ParseErrorBlock)errorBlock;

+ (void)parseActualWeatherJSONDictionary:(NSDictionary *)jsonDictionary
                              completion:(ActualForecastParseBlock)completionBlock
                                 onError:(ParseErrorBlock)errorBlock;

+ (void)parseForecastJSONString:(NSString *)jsonAsString
                     completion:(ForecastParseBlock)completionBlock
                        onError:(ParseErrorBlock)errorBlock;

+ (void)parseForecastJSONDictionary:(NSDictionary *)jsonDictionary
                     completion:(ForecastParseBlock)completionBlock
                        onError:(ParseErrorBlock)errorBlock;


@end
