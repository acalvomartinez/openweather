//
//  OWMJSONParserTests.m
//  openweather
//
//  Created by Toni on 17/12/15.
//  Copyright © 2015 Toni. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "StubFileUtil.h"

#import "OWMJSONParser.h"
#import "OWMActualWeather.h"

@interface OWMJSONParserTests : XCTestCase

@end

@implementation OWMJSONParserTests

- (void)testJSONParserShouldReturnErrorWhenPassedAnEmptyActualWeatherDictionary {
    
    [OWMJSONParser parseActualWeatherJSONDictionary:@{} completion:^(OWMActualWeather *actualWeather) {
        XCTAssertNil(actualWeather);
    } onError:^(NSError *parseError) {
        XCTAssertNotNil(parseError);
    }];
}

- (void)testJSONParserShouldReturnActualWeatherCompleteWhenPassedAnJSONStringWithActualWeather {
    NSDictionary *stub = [StubFileUtil dictionaryWithJSONStubFileNamed:@"ActualWeatherStubComplete"];
    
    [OWMJSONParser parseActualWeatherJSONDictionary:stub completion:^(OWMActualWeather *actualWeather) {
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
    [OWMJSONParser parseForecastJSONDictionary:@{} completion:^(NSArray<OWMForecast *> *forecast) {
        XCTAssertNil(forecast);
    } onError:^(NSError *parseError) {
        XCTAssertNotNil(parseError);
    }];
}


- (void)testJSONParserShouldReturnForecastCompleteWhenPassedAnJSONStringWithForecastFor5Days {
    NSDictionary *stub = [StubFileUtil dictionaryWithJSONStubFileNamed:@"Forecast5DaysStub"];
    
    [OWMJSONParser parseForecastJSONDictionary:stub completion:^(NSArray<OWMForecast *> *forecast) {
        XCTAssertNotNil(forecast);
        XCTAssertEqual(forecast.count, 5);
    } onError:^(NSError *parseError) {
        XCTAssertNil(parseError);
    }];
}

- (void)testJSONParserShouldReturnForecastCompleteWhenPassedAnJSONStringWithForecastFor16Days {
    NSDictionary *stub = [StubFileUtil dictionaryWithJSONStubFileNamed:@"Forecast16DaysStub"];
    
    [OWMJSONParser parseForecastJSONDictionary:stub completion:^(NSArray<OWMForecast *> *forecast) {
        XCTAssertNotNil(forecast);
        XCTAssertEqual(forecast.count, 16);
    } onError:^(NSError *parseError) {
        XCTAssertNil(parseError);
    }];
}







@end
