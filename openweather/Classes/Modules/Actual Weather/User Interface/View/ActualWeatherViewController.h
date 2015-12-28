//
//  ActualWeatherViewController.h
//  openweather
//
//  Created by Toni on 21/12/15.
//  Copyright © 2015 Toni. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "ActualWeatherViewInterface.h"

#import "ActualWeatherModuleInterface.h"


@interface ActualWeatherViewController : UIViewController <ActualWeatherViewInterface>

@property (nonatomic, strong) id<ActualWeatherModuleInterface> presenter;


@end
