//
//  ForecastViewCell.m
//  openweather
//
//  Created by Toni on 21/12/15.
//  Copyright © 2015 Toni. All rights reserved.
//

#import "ForecastViewCell.h"
#import "Forecast.h"

#import "NSDate+Formatter.h"

@interface ForecastViewCell ()

@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
@property (weak, nonatomic) IBOutlet UILabel *dayLabel;
@property (weak, nonatomic) IBOutlet UILabel *maxTemperatureLabel;
@property (weak, nonatomic) IBOutlet UILabel *minTemperatureLabel;

@end


@implementation ForecastViewCell

- (void)setupWithForecast:(Forecast *)forecast {
    self.maxTemperatureLabel.text = [NSString stringWithFormat:@"%d", (int)ceil(forecast.maxTemperature)];
    self.minTemperatureLabel.text = [NSString stringWithFormat:@"%d", (int)ceil(forecast.minTemperature)];
    self.dayLabel.text = [forecast.date dayOfTheWeek];
    
    self.iconImageView.image = [UIImage imageNamed:forecast.weatherIcon];
}

@end
