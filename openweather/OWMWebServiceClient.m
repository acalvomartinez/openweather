//
//  OWMWebServiceClient.m
//  openweather
//
//  Created by Toni on 18/12/15.
//  Copyright © 2015 Toni. All rights reserved.
//

#import "OWMWebServiceClient.h"
#import "OWMWebServiceConstants.h"
#import "OWMWebServiceRequestSerializer.h"

#import "NSError+OWMErrors.h"
#import "OWMNetworkingErrors.h"

#import <AFNetworking/AFNetworking.h>

@interface OWMWebServiceClient ()

@property (strong, nonatomic) AFHTTPSessionManager *sessionManager;

@end


@implementation OWMWebServiceClient

- (instancetype)init {
    return [self initWithAPIKey:OpenWeatherMapAPIKey];
}

- (instancetype)initWithAPIKey:(NSString *)APIKey {
    self = [super init];
    
    if (self) {
        _sessionManager = [[AFHTTPSessionManager alloc] initWithBaseURL:[NSURL URLWithString:OpenWeatherMapBaseURL]];
        _sessionManager.requestSerializer = [OWMWebServiceRequestSerializer serializerWithAPIKey:APIKey];
    }
    
    return self;
}


- (void)actualWeatherInLatitude:(float)latitude
                      longitude:(float)longitude
                        success:(CompletionBlock _Nullable)success
                        failure:(ErrorBlock _Nullable)failure {
    NSDictionary *parameters = @{
                                 OpenWeatherMapLatParameter: @(latitude),
                                 OpenWeatherMapLonParameter: @(longitude)
                                 };
    
    [self jsonForPath:OpenWeatherMapActualWeatherPath
           parameters:parameters
             retrying:OpenWeatherNetworkingRetries
              success:^(NSDictionary * _Nullable responseObject) {
                  if (success) {
                      success(responseObject);
                  }
              } failure:^(NSError * _Nullable error) {
                  if (failure) {
                      NSError *networkingError = [NSError errorWithDescription:NetworkingErrorActualWeatherRequest
                                                                        reason:error.localizedFailureReason
                                                                        domain:NetworkingErrorDomain
                                                                          code:NetworkingActualWeatherErrorCode
                                                                   parentError:error];
                      failure(networkingError);
                  }
              }];
    
}

- (void)forecastInLatitude:(float)latitude
                 longitude:(float)longitude
                      days:(NSInteger)days
                   success:(CompletionBlock _Nullable)success
                   failure:(ErrorBlock _Nullable)failure {
    NSDictionary *parameters = @{
                                 OpenWeatherMapLatParameter: @(latitude),
                                 OpenWeatherMapLonParameter: @(longitude),
                                 OpenWeatherMapDaysParameter: @(days)
                                 };
    

    [self jsonForPath:OpenWeatherMapForecastPath
           parameters:parameters
             retrying:OpenWeatherNetworkingRetries
              success:^(NSDictionary * _Nullable responseObject) {
                  if (success) {
                      success(responseObject);
                  }
              } failure:^(NSError * _Nullable error) {
                  if (failure) {
                      NSError *networkingError = [NSError errorWithDescription:NetworkingErrorForecastRequest
                                                                        reason:error.localizedFailureReason
                                                                        domain:NetworkingErrorDomain
                                                                          code:NetworkingForecastErrorCode
                                                                   parentError:error];
                      failure(networkingError);
                  }
              }];
}

#pragma mark - Private

- (void)jsonForPath:(NSString *)path
         parameters:(NSDictionary *)parameters
           retrying:(NSInteger)nTimes
            success:(CompletionBlock _Nullable)success
            failure:(ErrorBlock _Nullable)failure {
    if (nTimes <= 0) {
        if (failure) {
            NSError *networkingError = [NSError errorWithDescription:NetworkingErrorDescription
                                                              reason:NetworkingErrorNumberOfRetriesExceeded
                                                              domain:NetworkingErrorDomain
                                                                code:NetworkingNumberOfRetriesExceededErrorCode
                                                         parentError:nil];
            failure(networkingError);
        }
    } else {
        [self GET:path parameters:parameters success:^(NSDictionary * _Nullable responseObject) {
            if (success) {
                success(responseObject);
            }
        } failure:^(NSError * _Nullable error) {
            [self jsonForPath:path parameters:parameters retrying:nTimes-1 success:success failure:failure];
        }];
        
    }
}


- (void)GET:(NSString *)path
 parameters:(NSDictionary *)parameters
    success:(CompletionBlock _Nullable)success
    failure:(void (^)(NSError * _Nullable))failure {
    
    [self.sessionManager GET:path parameters:parameters progress:nil success:^(NSURLSessionTask *task, id responseObject) {
        if (success) {
            success(responseObject);
        }
    } failure:^(NSURLSessionTask *operation, NSError *error) {
        NSError *networkingError = [NSError errorWithDescription:NetworkingErrorDescription
                                                          reason:error.localizedFailureReason
                                                          domain:NetworkingErrorDomain
                                                            code:NetworkingErrorCode
                                                     parentError:error];
        if (failure) {
            failure(networkingError);
        }
    }];
}

@end
