//
//  OWMJSONParserTests.m
//  openweather
//
//  Created by Toni on 17/12/15.
//  Copyright © 2015 Toni. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "StubFileUtil.h"

#import "JSONParser.h"
#import "JSONActualWeather.h"

@interface JSONParserTests : XCTestCase

@end

@implementation JSONParserTests

- (void)testJSONParserShouldReturnErrorWhenPassedAnEmptyActualWeatherDictionary {
    
    [JSONParser parseActualWeatherJSONDictionary:@{} completion:^(JSONActualWeather *actualWeather) {
        XCTAssertNil(actualWeather);
    } onError:^(NSError *parseError) {
        XCTAssertNotNil(parseError);
    }];
}

- (void)testJSONParserShouldReturnActualWeatherCompleteWhenPassedAnJSONStringWithActualWeather {
    NSDictionary *stub = [StubFileUtil dictionaryWithJSONStubFileNamed:@"ActualWeatherStubComplete"];
    
    [JSONParser parseActualWeatherJSONDictionary:stub completion:^(JSONActualWeather *actualWeather) {
        XCTAssertNotNil(actualWeather);
        XCTAssertNotNil(actualWeather.date);
        XCTAssertNotNil(actualWeather.weather);
        XCTAssertNotNil(actualWeather.city);
        XCTAssertNotNil(actualWeather.sunset);
        XCTAssertNotNil(actualWeather.sunrise);
    } onError:^(NSError *parseError) {
        XCTAssertNil(parseError);
    }];
}

- (void)testJSONParserShouldReturnErrorWhenPassedAnEmptyForecastDictionary {
    [JSONParser parseForecastJSONDictionary:@{} completion:^(NSArray<JSONForecast *> *forecast) {
        XCTAssertNil(forecast);
    } onError:^(NSError *parseError) {
        XCTAssertNotNil(parseError);
    }];
}


- (void)testJSONParserShouldReturnForecastCompleteWhenPassedAnJSONStringWithForecastFor5Days {
    NSDictionary *stub = [StubFileUtil dictionaryWithJSONStubFileNamed:@"Forecast5DaysStub"];
    
    [JSONParser parseForecastJSONDictionary:stub completion:^(NSArray<JSONForecast *> *forecast) {
        XCTAssertNotNil(forecast);
        XCTAssertEqual(forecast.count, 5);
    } onError:^(NSError *parseError) {
        XCTAssertNil(parseError);
    }];
}

- (void)testJSONParserShouldReturnForecastCompleteWhenPassedAnJSONStringWithForecastFor16Days {
    NSDictionary *stub = [StubFileUtil dictionaryWithJSONStubFileNamed:@"Forecast16DaysStub"];
    
    [JSONParser parseForecastJSONDictionary:stub completion:^(NSArray<JSONForecast *> *forecast) {
        XCTAssertNotNil(forecast);
        XCTAssertEqual(forecast.count, 16);
    } onError:^(NSError *parseError) {
        XCTAssertNil(parseError);
    }];
}







@end
