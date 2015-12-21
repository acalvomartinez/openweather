//
//  ActualWeatherInteractorIO.h
//  openweather
//
//  Created by Toni on 20/12/15.
//  Copyright © 2015 Toni. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ActualWeatherInteractorInput <NSObject>
- (void)requestLocationServiceAuthorization;
- (void)findCurrentLocation;
@end

@protocol ActualWeatherInteractorOutput <NSObject>
- (void)foundUpActualWeather:(id)actualWeather;
- (void)foundUpForecast:(NSArray *)forecast;
- (void)actualWeatherFailWithError:(NSError *)error;
@end
