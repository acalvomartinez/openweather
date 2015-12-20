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

- (void)testJSONParserShouldReturnErrorWhenPassedAnEmptyActualWeatherJSONString {
    
    [JSONParser parseActualWeatherJSONString:@"" completion:^(JSONActualWeather *actualWeather) {
        XCTAssertNil(actualWeather);
    } onError:^(NSError *parseError) {
        XCTAssertNotNil(parseError);
    }];
}

- (void)testJSONParserShouldReturnErrorWhenPassedAnEmptyActualWeatherJSON {
    NSString *stub = [StubFileUtil loadJSONStubFileNamed:@"EmptyStub"];
    
    [JSONParser parseActualWeatherJSONString:stub completion:^(JSONActualWeather *actualWeather) {
        XCTAssertNil(actualWeather);
    } onError:^(NSError *parseError) {
        XCTAssertNotNil(parseError);
    }];
}

- (void)testJSONParserShouldReturnActualWeatherCompleteWhenPassedAnJSONStringWithActualWeather {
    NSString *stub = [StubFileUtil loadJSONStubFileNamed:@"ActualWeatherStubComplete"];
    
    [JSONParser parseActualWeatherJSONString:stub completion:^(JSONActualWeather *actualWeather) {
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

- (void)testJSONParserShouldReturnErrorWhenPassedAnEmptyForecastJSONString {
    [JSONParser parseForecastJSONString:@"" completion:^(NSArray<JSONForecast *> *forecast) {
        XCTAssertNil(forecast);
    } onError:^(NSError *parseError) {
        XCTAssertNotNil(parseError);
    }];
}

- (void)testJSONParserShouldReturnErrorWhenPassedAnEmptyForecastJSON {
    NSString *stub = [StubFileUtil loadJSONStubFileNamed:@"EmptyStub"];
    
    [JSONParser parseForecastJSONString:stub completion:^(NSArray<JSONForecast *> *forecast) {
        XCTAssertNil(forecast);
    } onError:^(NSError *parseError) {
        XCTAssertNotNil(parseError);
    }];
}

- (void)testJSONParserShouldReturnForecastCompleteWhenPassedAnJSONStringWithForecastFor5Days {
    NSString *stub = [StubFileUtil loadJSONStubFileNamed:@"Forecast5DaysStub"];
    
    [JSONParser parseForecastJSONString:stub completion:^(NSArray<JSONForecast *> *forecast) {
        XCTAssertNotNil(forecast);
        XCTAssertEqual(forecast.count, 5);
    } onError:^(NSError *parseError) {
        XCTAssertNotNil(parseError);
    }];
}

- (void)testJSONParserShouldReturnForecastCompleteWhenPassedAnJSONStringWithForecastFor16Days {
    NSString *stub = [StubFileUtil loadJSONStubFileNamed:@"Forecast16DaysStub"];
    
    [JSONParser parseForecastJSONString:stub completion:^(NSArray<JSONForecast *> *forecast) {
        XCTAssertNotNil(forecast);
        XCTAssertEqual(forecast.count, 16);
    } onError:^(NSError *parseError) {
        XCTAssertNotNil(parseError);
    }];
}




@end
