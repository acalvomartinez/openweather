//
//  ActualWeatherHeaderViewCell.m
//  openweather
//
//  Created by Toni on 22/12/15.
//  Copyright © 2015 Toni. All rights reserved.
//

#import "ActualWeatherHeaderViewCell.h"

#import "ActualWeather.h"
#import "NSDate+Formatter.h"

@interface ActualWeatherHeaderViewCell ()

@property (weak, nonatomic) IBOutlet UILabel *locationLabel;
@property (weak, nonatomic) IBOutlet UILabel *conditionLabel;
@property (weak, nonatomic) IBOutlet UILabel *temperatureLabel;
@property (weak, nonatomic) IBOutlet UILabel *maxTemperatureLabel;
@property (weak, nonatomic) IBOutlet UILabel *minTemperatureLabel;
@property (weak, nonatomic) IBOutlet UILabel *dayLabel;

@end

@implementation ActualWeatherHeaderViewCell

- (void)setupWithActualWeather:(ActualWeather *)actualWeather {
    self.locationLabel.text = actualWeather.cityName;
    self.conditionLabel.text = actualWeather.weatherCondition;
    self.temperatureLabel.text = [NSString stringWithFormat:@"%d", (int)ceil(actualWeather.temperature)];
    self.maxTemperatureLabel.text = [NSString stringWithFormat:@"%d", (int)ceil(actualWeather.maxTemperature)];
    self.minTemperatureLabel.text = [NSString stringWithFormat:@"%d", (int)ceil(actualWeather.minTemperature)];
    self.dayLabel.text = [actualWeather.date dayOfTheWeek];
}

@end
