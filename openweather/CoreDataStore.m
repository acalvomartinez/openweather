//
//  DataStoreManager.m
//  openweather
//
//  Created by Toni on 20/12/15.
//  Copyright © 2015 Toni. All rights reserved.
//

#import "CoreDataStore.h"
#import "CoreDataStoreErrors.h"
#import "NSError+OWMErrors.h"

#import "ActualWeatherManaged.h"
#import "ForecastManaged.h"
#import "JSONActualWeather.h"
#import "JSONCity.h"
#import "JSONWeatherData.h"
#import "JSONForecast.h"

@interface CoreDataStore ()

@property (nonatomic, strong) NSPersistentStoreCoordinator *persistentStoreCoordinator;
@property (nonatomic, strong) NSManagedObjectModel *managedObjectModel;
@property (nonatomic, strong) NSManagedObjectContext *managedObjectContext;

@end

@implementation CoreDataStore

- (instancetype)init {
    self = [super init];
    
    if (self) {
        _managedObjectModel = [NSManagedObjectModel mergedModelFromBundles:nil];
        
        _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:self.managedObjectModel];
        
        NSError *error = nil;
        NSURL *applicationDocumentsDirectory = [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
        NSDictionary *options = [NSDictionary dictionaryWithObjectsAndKeys:
                                 [NSNumber numberWithBool:YES], NSMigratePersistentStoresAutomaticallyOption,
                                 [NSNumber numberWithBool:YES], NSInferMappingModelAutomaticallyOption, nil];
        NSURL *storeURL = [applicationDocumentsDirectory URLByAppendingPathComponent:@"openweather.sqlite"];
        
        [_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType
                                                  configuration:nil
                                                            URL:storeURL
                                                        options:options error:&error];
        
        _managedObjectContext = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSMainQueueConcurrencyType];
        _managedObjectContext.persistentStoreCoordinator = self.persistentStoreCoordinator;
        _managedObjectContext.undoManager = nil;
    }
    
    return self;
}

#pragma mark - Public


- (id)newActualWeather {
    ActualWeatherManaged *actualWeather = [ActualWeatherManaged insertInManagedObjectContext:self.managedObjectContext];
    
    return actualWeather;
}


- (void)fecthActualWeatherWithCompletion:(ActualWeatherCompletionBlock)completionBlock
                                   error:(ActualWeatherErrorBlock)errorBlock {
    
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:[ActualWeatherManaged entityName]];
    
    [self.managedObjectContext performBlock:^{
        NSArray *results = [self.managedObjectContext executeFetchRequest:fetchRequest error:NULL];
        
        if (results.count == 0) {
            if (errorBlock) {
                NSError *error = [NSError errorWithDescription:CoreDataStoreActualWeatherNotExistsDescription
                                                        reason:CoreDataStoreActualWeatherNotExistsReason
                                                        domain:CoreDataStoreErrorDomain
                                                          code:CoreDataStoreActualWeatherNotExists
                                                   parentError:nil];
                
                errorBlock(error);
            }
        }
        
        if (completionBlock)
        {
            completionBlock([results firstObject]);
        }
    }];
    
}

- (void)saveOnError:(ActualWeatherErrorBlock)errorBlock {
    
    NSError *error;
    [self.managedObjectContext save:&error];
    
    if (error) {
        errorBlock(error);
    }
}

- (void)updateActualWeatherManaged:(ActualWeatherManaged *)objectManaged
             withJSONActualWeather:(JSONActualWeather *)JSONObject
                           onError:(ActualWeatherErrorBlock)errorBlock {
    
    [objectManaged setDate:JSONObject.date];
    [objectManaged setCityName:JSONObject.city.name];
    [objectManaged setIcon:JSONObject.weather.icon];
    [objectManaged setWeatherCondition:JSONObject.weather.condition];
    [objectManaged setSunrise:JSONObject.sunrise];
    [objectManaged setSunset:JSONObject.sunset];
    [objectManaged setTemperatureValue:JSONObject.weather.temperature];
    [objectManaged setMaxTemperatureValue:JSONObject.weather.maxTemperature];
    [objectManaged setMinTemperatureValue:JSONObject.weather.minTemperature];
    [objectManaged setHumidityValue:JSONObject.weather.humidity];
    [objectManaged setPressureValue:JSONObject.weather.pressure];
    [objectManaged setRain3hValue:JSONObject.weather.rain3h];
    [objectManaged setSnow3hValue:JSONObject.weather.snow3h];
    [objectManaged setWindDirectionValue:JSONObject.weather.windDirection];
    [objectManaged setWindSpeedValue:JSONObject.weather.windSpeed];
    [objectManaged setCloudinessValue:JSONObject.weather.cloudiness];
    
    [self saveOnError:^(NSError *error) {
        if (error) {
            errorBlock(error);
        }
    }];
}

- (void)updateActualWeatherManaged:(ActualWeatherManaged *)objectManaged
                  withJSONForecast:(NSArray<JSONForecast *> *)JSONObject
                           onError:(ActualWeatherErrorBlock)errorBlock  {
    
    [objectManaged.forecastSet removeAllObjects];
    
    NSRange range = NSMakeRange(1,[JSONObject count]-1);
    
    for (JSONForecast *forecast in [JSONObject subarrayWithRange:range]) {
        [objectManaged.forecastSet addObject:[self forecastManagedFromJSONForecast:forecast]];
    }
    
    [self saveOnError:^(NSError *error) {
        if (error) {
            errorBlock(error);
        }
    }];

}

- (ForecastManaged *)forecastManagedFromJSONForecast:(JSONForecast *)JSONObject  {
    ForecastManaged *forecast = [ForecastManaged insertInManagedObjectContext:self.managedObjectContext];
    
    [forecast setDate:JSONObject.date];
    [forecast setIcon:JSONObject.weather.icon];
    [forecast setWeatherCondition:JSONObject.weather.condition];
    [forecast setMaxTemperatureValue:JSONObject.weather.maxTemperature];
    [forecast setMinTemperatureValue:JSONObject.weather.minTemperature];
    [forecast setHumidityValue:JSONObject.weather.humidity];
    [forecast setPressureValue:JSONObject.weather.pressure];

    return forecast;
}




@end
