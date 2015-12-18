//
//  OWMRequestSerializer.m
//  openweather
//
//  Created by Toni on 18/12/15.
//  Copyright © 2015 Toni. All rights reserved.
//

#import "OWMWebServiceRequestSerializer.h"
#import "OWMWebServiceConstants.h"

@interface OWMWebServiceRequestSerializer ()

@property (copy, nonatomic) NSString *APIKey;

@end

@implementation OWMWebServiceRequestSerializer

+ (instancetype)serializerWithAPIKey:(NSString *)APIkey
{
    OWMWebServiceRequestSerializer *serializer = [self serializer];
    serializer.APIKey = APIkey;
    
    return serializer;
}

- (NSURLRequest *)requestBySerializingRequest:(NSURLRequest *)request
                               withParameters:(id)parameters
                                        error:(NSError * __autoreleasing *)error{
    NSMutableDictionary *defaultParameters = [@{
                                                OpenWeatherAPIKeyParameter: self.APIKey,
                                                @"format": @"json"
                                                } mutableCopy];
    [defaultParameters addEntriesFromDictionary:parameters];
    
    return [super requestBySerializingRequest:request withParameters:defaultParameters error: error];
}


@end
