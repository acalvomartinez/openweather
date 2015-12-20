//
//  ActualWeatherInteractor.h
//  openweather
//
//  Created by Toni on 20/12/15.
//  Copyright © 2015 Toni. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ActualWeatherInteractorIO.h"

@import CoreLocation;

@class ActualWeatherManager;

@interface ActualWeatherInteractor : NSObject <ActualWeatherInteractorInput, CLLocationManagerDelegate>

@property (nonatomic, weak) id<ActualWeatherInteractorOutput> output;

- (instancetype)initWithDataManager:(ActualWeatherManager *)dataManager;

@end
