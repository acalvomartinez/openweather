//
//  DataStoreErrors.h
//  openweather
//
//  Created by Toni on 20/12/15.
//  Copyright © 2015 Toni. All rights reserved.
//

#import <Foundation/Foundation.h>

static NSString * const CoreDataStoreErrorDomain = @"com.unagistudio.openweather.coredata";

typedef enum coreDataErrorTypes {
    CoreDataStoreError,
    CoreDataStoreActualWeatherNotExists
} CoreDataErrorTypes;

static NSString * const CoreDataStoreActualWeatherNotExistsDescription = @"Something about Core Data";
static NSString * const CoreDataStoreActualWeatherNotExistsReason = @"JSON empty data";
