//
//  ActualWeatherManager.m
//  openweather
//
//  Created by Toni on 20/12/15.
//  Copyright © 2015 Toni. All rights reserved.
//

#import "ActualWeatherDataManager.h"
#import "ActualWeatherManaged.h"
#import "ActualWeather.h"

#import "CoreDataStore.h"
#import "OWMWebServiceClient.h"
#import "JSONParser.h"

#import "ActualWeatherMapper.h"

@interface ActualWeatherDataManager ()

@property (nonatomic, strong) CoreDataStore *dataStore;
@property (nonatomic, strong) OWMWebServiceClient *owmClient;

@property (nonatomic, strong) ActualWeatherManaged *actualWeatherManaged;

@end

@implementation ActualWeatherDataManager

- (instancetype)init {
    self = [super init];
    
    if (self) {
        _dataStore = [[CoreDataStore alloc] init];
        _owmClient = [[OWMWebServiceClient alloc] init];
    }
    return self;
}

- (void)createActualWeatherManagedOnErrorBlock:(ErrorBlock)errorBlock {
    self.actualWeatherManaged = [self.dataStore newActualWeather];
    [self.dataStore saveOnError:^(NSError *error) {
        if (errorBlock) {
            errorBlock(error);
        }
    }];
}

- (void)actualWeatherOnCompletionBlock:(ActualWeatherFecthBlock)completionBlock
                            errorBlock:(ErrorBlock)errorBlock {
    
    __weak ActualWeatherDataManager *weakself = self;
    
    [self.dataStore fecthActualWeatherWithCompletion:^(ActualWeatherManaged *objectManaged) {
        
        weakself.actualWeatherManaged = objectManaged;
        
        ActualWeather *actualWeather = [ActualWeatherMapper actualWeatherFromManagedObject:objectManaged];
        
        if (completionBlock) {
            completionBlock(actualWeather);
        }
        
    } error:^(NSError *error) {
        if (errorBlock) {
            errorBlock(error);
        }
    }];
    
}

- (void)actualWeatherForLocation:(CLLocationCoordinate2D)coordinate
    actualWeatherCompletionBlock:(ActualWeatherFecthBlock _Nullable)actualWeatherCompletionBlock
         forecastCompletionBlock:(ForecastFecthBlock _Nullable)forecastCompletionBlock
                      errorBlock:(ErrorBlock)errorBlock {
    
    if (self.actualWeatherManaged) {
        [self updateActualWeatherLocation:coordinate
             actualWeatherCompletionBlock:^(ActualWeather * _Nullable actualWeather) {
                 if (actualWeatherCompletionBlock) {
                     actualWeatherCompletionBlock(actualWeather);
                 }
             } forecastCompletionBlock:^(NSArray<Forecast *> * _Nullable forecast) {
                 if (forecastCompletionBlock) {
                     forecastCompletionBlock(forecast);
                 }
             } errorBlock:^(NSError * _Nullable error) {
                 if (errorBlock) {
                     errorBlock(error);
                 }
             }];
    }
}


#pragma mark - Web service 

- (void)updateActualWeatherLocation:(CLLocationCoordinate2D)coordinate
      actualWeatherCompletionBlock:(ActualWeatherFecthBlock _Nullable)actualWeatherCompletionBlock
            forecastCompletionBlock:(ForecastFecthBlock _Nullable)forecastCompletionBlock
                         errorBlock:(ErrorBlock)errorBlock {
    
    __weak ActualWeatherDataManager *weakself = self;
    
    [self.owmClient actualWeatherInLatitude:coordinate.latitude
                                  longitude:coordinate.longitude
                                    success:^(NSDictionary * _Nullable jsonDictionary) {
                                        [weakself updateWithJSONActualWeather:jsonDictionary
                                                              completionBlock:actualWeatherCompletionBlock
                                                                   errorBlock:errorBlock];
                                    } failure:^(NSError * _Nullable error) {
                                        if (errorBlock) {
                                            errorBlock(error);
                                        }
                                    }];
    
    [self.owmClient forecastInLatitude:coordinate.latitude
                             longitude:coordinate.longitude
                                  days:5
                               success:^(NSDictionary * _Nullable jsonDictionary) {
                                   [weakself updateWithJSONForecast:jsonDictionary
                                                    completionBlock:forecastCompletionBlock
                                                         errorBlock:errorBlock];
                               } failure:^(NSError * _Nullable error) {
                                   if (errorBlock) {
                                       errorBlock(error);
                                   }
                               }];
}

- (void)updateWithJSONActualWeather:(NSDictionary *)jsonDictionary
                    completionBlock:(ActualWeatherFecthBlock)completionBlock
                         errorBlock:(ErrorBlock)errorBlock {
    
    __weak ActualWeatherDataManager *weakself = self;
    
    [JSONParser parseActualWeatherJSONDictionary:jsonDictionary completion:^(JSONActualWeather *actualWeatherJSON) {
        
        [weakself.dataStore updateActualWeatherManaged:weakself.actualWeatherManaged
                                 withJSONActualWeather:actualWeatherJSON
                                               onError:^(NSError *error) {
                                          if (errorBlock) {
                                              errorBlock(error);
                                          }
                                      }];
        
        ActualWeather *actualWeather = [ActualWeatherMapper actualWeatherFromManagedObject:weakself.actualWeatherManaged];
        
        if (completionBlock) {
            completionBlock(actualWeather);
        }
        
        [weakself.dataStore saveOnError:^(NSError *error) {
            if (errorBlock) {
                errorBlock(error);
            }
        }];
    } onError:^(NSError *error) {
        if (errorBlock) {
            errorBlock(error);
        }
    }];
}

- (void)updateWithJSONForecast:(NSDictionary *)jsonDictionary
               completionBlock:(ForecastFecthBlock)completionBlock
                    errorBlock:(ErrorBlock)errorBlock {
    __weak ActualWeatherDataManager *weakself = self;
    
    [JSONParser parseForecastJSONDictionary:jsonDictionary completion:^(NSArray<JSONForecast *> *forecastJSON) {
        
        [weakself.dataStore updateActualWeatherManaged:weakself.actualWeatherManaged
                                      withJSONForecast:forecastJSON
                                               onError:^(NSError *error) {
                                          if (errorBlock) {
                                              errorBlock(error);
                                          }
                                      }];
        ActualWeather *actualWeather = [ActualWeatherMapper actualWeatherFromManagedObject:weakself.actualWeatherManaged];
        
        if (completionBlock) {
            completionBlock(actualWeather.forecast);
        }
        
        [weakself.dataStore saveOnError:^(NSError *error) {
            if (errorBlock) {
                errorBlock(error);
            }
        }];
    } onError:^(NSError *error) {
        if (errorBlock) {
            errorBlock(error);
        }
    }];
}


@end
