//
//  ForecastViewCell.m
//  openweather
//
//  Created by Toni on 21/12/15.
//  Copyright © 2015 Toni. All rights reserved.
//

#import "ForecastViewCell.h"
#import "Forecast.h"

@interface ForecastViewCell ()

@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
@property (weak, nonatomic) IBOutlet UILabel *dayLabel;
@property (weak, nonatomic) IBOutlet UILabel *maxTemperatureLabel;
@property (weak, nonatomic) IBOutlet UILabel *minTemperatureLabel;

@end


@implementation ForecastViewCell

- (void)setupWithForecast:(Forecast *)forecast {
    self.maxTemperatureLabel.text = [NSString stringWithFormat:@"%.2f", forecast.maxTemperature];
    self.minTemperatureLabel.text = [NSString stringWithFormat:@"%.2f", forecast.minTemperature];
    self.dayLabel.text = [NSString stringWithFormat:@"%@", forecast.date];
}

@end
