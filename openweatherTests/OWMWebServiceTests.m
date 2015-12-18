//
//  OWMWebServiceTests.m
//  openweather
//
//  Created by Toni on 18/12/15.
//  Copyright © 2015 Toni. All rights reserved.
//

#import <XCTest/XCTest.h>

#import <OHHTTPStubs/OHHTTPStubs.h>
#import <OHHTTPStubs/OHPathHelpers.h>
#import "OWMWebServiceClient.h"


@interface OWMWebServiceTests : XCTestCase

@property (strong, nonatomic) OWMWebServiceClient *client;


@end

@implementation OWMWebServiceTests

- (void)setUp {
    [super setUp];
    
    self.client = [[OWMWebServiceClient alloc] initWithAPIKey:@"test"];
}

- (void)tearDown {
    self.client = nil;
    [OHHTTPStubs removeAllStubs];
    
    [super tearDown];
}

- (void)testActualWeatherRequest {
    NSURLRequest * __block requestSent = nil;
    [OHHTTPStubs stubRequestsPassingTest:^BOOL(NSURLRequest *request) {
        requestSent = request;
        return YES;
    } withStubResponse:^OHHTTPStubsResponse*(NSURLRequest *request) {
        return [OHHTTPStubsResponse responseWithFileAtPath:OHPathForFile(@"ActualWeatherStubComplete.json",self.class)
                                                statusCode:200 headers:@{@"Content-Type":@"application/json"}];
    }];
    
    XCTestExpectation *completed = [self expectationWithDescription:@"completed"];
    
    NSDictionary __block *response = nil;
    [self.client actualWeatherInLatitude:40.47734 longitude:-3.684926 success:^(NSDictionary * _Nullable object) {
        response = object;
        [completed fulfill];
    } failure:nil];
    
    [self waitForExpectationsWithTimeout:1 handler:nil];
    
    NSURL *expectedURL = [NSURL URLWithString:@"http://api.openweathermap.org/data/2.5/weather?APPID=test&lat=40.47734&lon=-3.684926"];
    
    XCTAssertEqualObjects(expectedURL, requestSent.URL);
    XCTAssertEqualObjects(@"GET", requestSent.HTTPMethod);
    XCTAssertTrue([response isKindOfClass:[NSDictionary class]]);
}

- (void)testForecast5DaysRequest {
    NSURLRequest * __block requestSent = nil;
    [OHHTTPStubs stubRequestsPassingTest:^BOOL(NSURLRequest *request) {
        requestSent = request;
        return YES;
    } withStubResponse:^OHHTTPStubsResponse*(NSURLRequest *request) {
        return [OHHTTPStubsResponse responseWithFileAtPath:OHPathForFile(@"Forecast5DaysStub.json",self.class)
                                                statusCode:200 headers:@{@"Content-Type":@"application/json"}];
    }];
    
    XCTestExpectation *completed = [self expectationWithDescription:@"completed"];
    
    NSDictionary __block *response = nil;
    [self.client forecastInLatitude:40.47734 longitude:-3.684926 days:5 success:^(NSDictionary * _Nullable object) {
        response = object;
        [completed fulfill];
    } failure:nil];
    
    [self waitForExpectationsWithTimeout:1 handler:nil];
    
    NSURL *expectedURL = [NSURL URLWithString:@"http://api.openweathermap.org/data/2.5/forecast/daily?APPID=test&cnt=5&lat=40.47734&lon=-3.684926"];
    
    XCTAssertEqualObjects(expectedURL, requestSent.URL);
    XCTAssertEqualObjects(@"GET", requestSent.HTTPMethod);
    XCTAssertTrue([response isKindOfClass:[NSDictionary class]]);
}

@end
