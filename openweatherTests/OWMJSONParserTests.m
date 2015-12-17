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
    NSString *stub = [StubFileUtil loadJSONStubFileNamed:@"EmptyActualWeatherStub"];
    
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



@end
