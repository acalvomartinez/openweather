//
//  OWMJSONParser.m
//  openweather
//
//  Created by Toni on 17/12/15.
//  Copyright © 2015 Toni. All rights reserved.
//

#import "OWMJSONParser.h"
#import "OWMJSONParameters.h"

@implementation OWMJSONParser

+ (void)parseActualWeatherJSONString:(NSString *)jsonAsString
                          completion:(ActualForecastParseBlock)completionBlock
                             onError:(ParseErrorBlock)errorBlock {
    NSData *data = [jsonAsString dataUsingEncoding:NSUTF8StringEncoding];
    
    NSError *error;
    NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
    
    if (error) {
        if (errorBlock != nil) errorBlock(error);
        return;
    }
    
    NSArray *jsonRadars = [jsonDictionary objectForKey:@"result"];
    
    if (jsonRadars.count == 0) {
        
        
        errorBlock(error);
    }
    
    NSMutableArray<RadarJSON *> *radars = [[NSMutableArray alloc] initWithCapacity:jsonRadars.count];
    
    for (NSDictionary *radarDictionary in jsonRadars) {
        RadarJSON *radar = [self radarJSONWithDictionary:radarDictionary];
        
        if (radar) {
            [radars addObject:radar];
        }
    }
    
    return radars;
}

+ (void)parseForecastJSONString:(NSString *)jsonAsString
                     completion:(ForecastParseBlock)completionBlock
                        onError:(ParseErrorBlock)errorBlock {
    
}



@end
