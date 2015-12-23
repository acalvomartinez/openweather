//
//  ForecastViewCell.h
//  openweather
//
//  Created by Toni on 21/12/15.
//  Copyright © 2015 Toni. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UnitsHelper.h"

@class Forecast;

@interface ForecastViewCell : UITableViewCell

- (void)setupWithForecast:(Forecast *)forecast;

@end
