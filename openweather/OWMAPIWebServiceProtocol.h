//
//  OWMAPIWebServiceProtocol.h
//  openweather
//
//  Created by Toni on 18/12/15.
//  Copyright © 2015 Toni. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^CompletionBlock)(NSDictionary * _Nullable);
typedef void(^ErrorBlock)(NSError * _Nullable);

@protocol OWMAPIWebServiceProtocol <NSObject>

@required

- (void)actualWeatherInLatitude:(float)latitude
                      longitude:(float)longitude
                        success:(CompletionBlock _Nullable)success
                        failure:(ErrorBlock _Nullable)failure;

- (void)forecastInLatitude:(float)latitude
                 longitude:(float)longitude
                      days:(NSInteger)days
                   success:(CompletionBlock _Nullable)success
                   failure:(ErrorBlock _Nullable)failure;

@optional


@end
