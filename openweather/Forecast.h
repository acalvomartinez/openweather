//
//  Forecast.h
//  openweather
//
//  Created by Toni on 20/12/15.
//  Copyright © 2015 Toni. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Forecast : NSObject

@property (nonatomic, strong) NSDate *date;

@property (nonatomic, copy) NSString *weatherCondition;
@property (nonatomic, copy) NSString *weatherIcon;

@property (nonatomic, assign) float maxTemperature;
@property (nonatomic, assign) float minTemperature;
@property (nonatomic, assign) float pressure;
@property (nonatomic, assign) float humidity;


@end
