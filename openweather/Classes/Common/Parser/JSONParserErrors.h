//
//  ParserErrors.h
//  openweather
//
//  Created by Toni on 17/12/15.
//  Copyright © 2015 Toni. All rights reserved.
//

#import <Foundation/Foundation.h>

static NSString * const ParserErrorDomain = @"com.unagistudio.openweather.parser.ErrorDomain";

typedef enum parseErrorTypes {
    ParserError,
    ParserErrorEmptyJSONFile,
    ParserInternalError
} ParseErrorTypes;

static NSString * const ParserErrorEmptyJSONDescription = @"Something about JSONParser";
static NSString * const ParserErrorEmptyJSONReasonError = @"JSON empty data";

static NSString * const ParserErrorNoForecastDataDescription = @"Something about JSONParser";
static NSString * const ParserErrorNoForecastDataReasonError = @"Forecast empty data";