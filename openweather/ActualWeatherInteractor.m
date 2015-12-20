//
//  ActualWeatherInteractor.m
//  openweather
//
//  Created by Toni on 20/12/15.
//  Copyright © 2015 Toni. All rights reserved.
//

#import "ActualWeatherInteractor.h"
#import "CoreDataStoreErrors.h"
#import "ActualWeatherManager.h"
#import "ActualWeather.h"

@import CoreLocation;

@interface ActualWeatherInteractor ()

@property (nonatomic, strong) ActualWeatherManager *dataManager;

@property (nonatomic, strong) CLLocationManager *locationManager;
@property (nonatomic, strong) CLLocation *currentLocation;
@property (nonatomic, assign) BOOL isFirstUpdate;

@end

@implementation ActualWeatherInteractor

- (instancetype)initWithDataManager:(ActualWeatherManager *)dataManager {
    if ((self = [super init]))
    {
        _dataManager = dataManager;
        
        [self setupLocationManager];
    }
    
    return self;
}

- (void)findCurrentLocation {
    self.isFirstUpdate = YES;
    [self.locationManager startUpdatingLocation];
    
    __weak ActualWeatherInteractor *weakself = self;
    
    [self.dataManager actualWeatherOnCompletionBlock:^(ActualWeather *actualWeather) {
        [weakself.output foundUpActualWeather:actualWeather];
    } errorBlock:^(NSError * _Nullable error) {
        if (error.code == CoreDataStoreActualWeatherNotExists) {
            ActualWeather *blankWeather = [ActualWeather blankWeather];
            
            [weakself.output foundUpActualWeather:blankWeather];
        }
    }];
}


#pragma mark - Core Location


- (void)setupLocationManager {
    _locationManager = [[CLLocationManager alloc] init];
    _locationManager.delegate = self;
}


- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations {
    if (self.isFirstUpdate) {
        self.isFirstUpdate = NO;
        return;
    }
    
    CLLocation *location = [locations lastObject];
    
    if (location.horizontalAccuracy > 0) {
        self.currentLocation = location;
        [self.locationManager stopUpdatingLocation];
        
        __weak ActualWeatherInteractor *weakself = self;
        
        [self.dataManager actualWeatherForLocation:location.coordinate
                      actualWeatherCompletionBlock:^(ActualWeather * _Nullable actualWeather) {
                          [weakself.output foundUpActualWeather:actualWeather];
                      } forecastCompletionBlock:^(NSArray<Forecast *> * _Nullable forecast) {
                          [weakself.output foundUpForecast:forecast];
                      } errorBlock:^(NSError * _Nullable error) {
                          [weakself.output actualWeatherFailWithError:error];
                      }];
    }
}

@end
