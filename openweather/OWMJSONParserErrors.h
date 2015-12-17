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

static NSString * const ParserErrorEmpyJSONDescription = @"Something is happing with JSONParser";
static NSString * const ParserErrorEmpyJSONReasonError = @"JSON empty data";