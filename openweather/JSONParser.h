//
//  OWMJSONParser.h
//  openweather
//
//  Created by Toni on 17/12/15.
//  Copyright © 2015 Toni. All rights reserved.
//

#import <Foundation/Foundation.h>

@class JSONActualWeather;
@class JSONForecast;

typedef void(^ActualForecastParseBlock)(JSONActualWeather *);
typedef void(^ForecastParseBlock)(NSArray <JSONForecast *> *);
typedef void(^ParseErrorBlock)(NSError *);

@interface JSONParser : NSObject

+ (void)parseActualWeatherJSONString:(NSString *)jsonAsString
                          completion:(ActualForecastParseBlock)completionBlock
                             onError:(ParseErrorBlock)errorBlock;

+ (void)parseForecastJSONString:(NSString *)jsonAsString
                     completion:(ForecastParseBlock)completionBlock
                        onError:(ParseErrorBlock)errorBlock;

@end
