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

- (void)testJSONParserShouldReturnErrorWhenPassedAnEmptyActualWeatherJSONString {
    
    [OWMJSONParser parseActualWeatherJSONString:@"" completion:^(OWMActualWeather *actualWeather) {
        XCTAssertNil(actualWeather);
    } onError:^(NSError *parseError) {
        XCTAssertNotNil(parseError);
    }];
}

- (void)testJSONParserShouldReturnErrorWhenPassedAnEmptyActualWeatherJSON {
    NSString *stub = [StubFileUtil loadJSONStubFileNamed:@"EmptyStub"];
    
    [OWMJSONParser parseActualWeatherJSONString:stub completion:^(OWMActualWeather *actualWeather) {
        XCTAssertNil(actualWeather);
    } onError:^(NSError *parseError) {
        XCTAssertNotNil(parseError);
    }];
}

- (void)testJSONParserShouldReturnActualWeatherCompleteWhenPassedAnJSONStringWithActualWeather {
    NSString *stub = [StubFileUtil loadJSONStubFileNamed:@"ActualWeatherStubComplete"];
    
    [OWMJSONParser parseActualWeatherJSONString:stub completion:^(OWMActualWeather *actualWeather) {
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
    [OWMJSONParser parseForecastJSONString:@"" completion:^(NSArray<OWMForecast *> *forecast) {
        XCTAssertNil(forecast);
    } onError:^(NSError *parseError) {
        XCTAssertNotNil(parseError);
    }];
}

- (void)testJSONParserShouldReturnErrorWhenPassedAnEmptyForecastJSON {
    NSString *stub = [StubFileUtil loadJSONStubFileNamed:@"EmptyStub"];
    
    [OWMJSONParser parseForecastJSONString:stub completion:^(NSArray<OWMForecast *> *forecast) {
        XCTAssertNil(forecast);
    } onError:^(NSError *parseError) {
        XCTAssertNotNil(parseError);
    }];
}

- (void)testJSONParserShouldReturnForecastCompleteWhenPassedAnJSONStringWithForecastFor5Days {
    NSString *stub = [StubFileUtil loadJSONStubFileNamed:@"Forecast5DaysStub"];
    
    [OWMJSONParser parseForecastJSONString:stub completion:^(NSArray<OWMForecast *> *forecast) {
        XCTAssertNotNil(forecast);
        XCTAssertEqual(forecast.count, 5);
    } onError:^(NSError *parseError) {
        XCTAssertNil(parseError);
    }];
}

- (void)testJSONParserShouldReturnForecastCompleteWhenPassedAnJSONStringWithForecastFor16Days {
    NSString *stub = [StubFileUtil loadJSONStubFileNamed:@"Forecast16DaysStub"];
    
    [OWMJSONParser parseForecastJSONString:stub completion:^(NSArray<OWMForecast *> *forecast) {
        XCTAssertNotNil(forecast);
        XCTAssertEqual(forecast.count, 16);
    } onError:^(NSError *parseError) {
        XCTAssertNil(parseError);
    }];
}




@end
