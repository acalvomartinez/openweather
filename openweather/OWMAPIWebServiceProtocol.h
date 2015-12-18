//
//  OWMAPIWebServiceProtocol.h
//  openweather
//
//  Created by Toni on 18/12/15.
//  Copyright © 2015 Toni. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol OWMAPIWebServiceProtocol <NSObject>

@required

- (void)actualWeatherInLatitude:(float)latitude
                      longitude:(float)longitude
                        success:(void (^ _Nullable)(NSString * _Nullable))success
                        failure:(void (^ _Nullable)(NSError * _Nullable))failure;

- (void)forecastInLatitude:(float)latitude
                 longitude:(float)longitude
                      days:(NSInteger)days
                   success:(void (^ _Nullable)(NSString * _Nullable))success
                   failure:(void (^ _Nullable)(NSError * _Nullable))failure;

@optional


@end
