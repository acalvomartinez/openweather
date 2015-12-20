//
//  ParserErrors.h
//  openweather
//
//  Created by Toni on 17/12/15.
//  Copyright © 2015 Toni. All rights reserved.
//

#import <Foundation/Foundation.h>

static NSString * const ParserErrorDomain = @"com.unagistudio.openweather.parser.ErrorDomain";

enum {
    ParserError,
    ParserErrorEmptyJSONFile,
    ParserInternalError
};

static NSString * const ParserErrorEmptyJSONDescription = @"Something is happing with JSONParser";
static NSString * const ParserErrorEmptyJSONReasonError = @"JSON empty data";

static NSString * const ParserErrorNoForecastDataDescription = @"Something is happing with JSONParser";
static NSString * const ParserErrorNoForecastDataReasonError = @"Forecast empty data";