//
//  DetailWeatherCell.m
//  openweather
//
//  Created by Toni on 22/12/15.
//  Copyright © 2015 Toni. All rights reserved.
//

#import "DetailWeatherViewCell.h"

#import "ActualWeather.h"
#import "NSDate+Formatter.h"

@interface DetailWeatherViewCell ()

@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;
@property (weak, nonatomic) IBOutlet UILabel *valueLabel;

@end

@implementation DetailWeatherViewCell

- (void)setupWithDetailWeather:(NSDictionary *)detail {
    
    NSString *description = [detail objectForKey:DetailWeatherDescriptionKey];
    
    self.descriptionLabel.text = description;
    
    
    NSString *value;
    
    if ([[detail valueForKey:DetailWeatherValueKey] isKindOfClass:[NSDate class]]) {
        value = [[detail valueForKey:DetailWeatherValueKey] hourOfTheDay];
    } else {
        value = [NSString stringWithFormat:@"%.2f", [[detail valueForKey:DetailWeatherValueKey] floatValue]];
    }
    
    value = [NSString stringWithFormat:@"%@ %@", value, [detail valueForKey:DetailWeatherUnitsKey]];
    
    self.valueLabel.text = value;
}

@end
