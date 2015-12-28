//
//  ActualWeatherPresenter.h
//  openweather
//
//  Created by Toni on 21/12/15.
//  Copyright © 2015 Toni. All rights reserved.
//

#import <Foundation/Foundation.h>
@import UIKit;

#import "ActualWeatherModuleInterface.h"
#import "ActualWeatherInteractorIO.h"

@class ActualWeatherWireframe;

@protocol ActualWeatherViewInterface;

@interface ActualWeatherPresenter : NSObject <ActualWeatherModuleInterface, ActualWeatherInteractorOutput>

@property (nonatomic, strong) id<ActualWeatherInteractorInput> interactor;
@property (nonatomic, strong) ActualWeatherWireframe *wireframe;
@property (nonatomic, strong) UIViewController<ActualWeatherViewInterface> *view;

@end
