//
//  DataStoreErrors.h
//  openweather
//
//  Created by Toni on 20/12/15.
//  Copyright © 2015 Toni. All rights reserved.
//

#import <Foundation/Foundation.h>

static NSString * const DataStoreErrorDomain = @"com.unagistudio.openweather.dataStore";

typedef enum parseErrorTypes {
    DataStoreError,
    DataStoreActualWeatherNotExists
} ParseErrorTypes;

static NSString * const DataStoreActualWeatherNotExistsDescription = @"Something about Core Data";
static NSString * const DataStoreActualWeatherNotExistsReason = @"JSON empty data";
