//
//  ActualWeatherWireframe.h
//  openweather
//
//  Created by Toni on 21/12/15.
//  Copyright © 2015 Toni. All rights reserved.
//

#import <Foundation/Foundation.h>
@import UIKit;

@class ActualWeatherPresenter;

@interface ActualWeatherWireframe : NSObject

@property (nonatomic, strong) ActualWeatherPresenter *presenter;

- (void)presentActualWeatherInterfaceFromWindow:(UIWindow *)window;

@end
