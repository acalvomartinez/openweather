//
//  ActualWeatherHeaderViewCell.h
//  openweather
//
//  Created by Toni on 22/12/15.
//  Copyright © 2015 Toni. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ActualWeather;

@interface ActualWeatherHeaderViewCell : UITableViewCell

- (void)setupWithActualWeather:(ActualWeather *)actualWeather;

@end
