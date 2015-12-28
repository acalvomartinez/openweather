//
//  OWMNetworkingError.h
//  openweather
//
//  Created by Toni on 18/12/15.
//  Copyright © 2015 Toni. All rights reserved.
//

#import <Foundation/Foundation.h>

static NSString * const NetworkingErrorDomain = @"com.unagistudio.openweather.networking.ErrorDomain";

typedef enum networkingErrorTypes {
    NetworkingErrorCode,
    NetworkingConnectionErrorCode,
    NetworkingNotAvailableErrorCode,
    NetworkingNumberOfRetriesExceededErrorCode,
    NetworkingActualWeatherErrorCode,
    NetworkingForecastErrorCode
} NetworkingsErrorTypes;

static NSString * const NetworkingErrorDescription = @"Something about Networking";
static NSString * const NetworkingErrorConnection = @"Connection error";

static NSString * const NetworkingErrorNotAvailable = @"Network not available";
static NSString * const NetworkingErrorNumberOfRetriesExceeded = @"Number of retries exceeded.";

static NSString * const NetworkingErrorActualWeatherRequest = @"Error in Actual Weather Request. Check your network connection and try later.";
static NSString * const NetworkingErrorForecastRequest = @"Error in Forecast Request";