//
//  NSError+OWMErrors.m
//  openweather
//
//  Created by Toni on 18/12/15.
//  Copyright © 2015 Toni. All rights reserved.
//

#import "NSError+OWMErrors.h"

@implementation NSError (OWMErrors)

+ (NSError *)errorWithDescription:(NSString *)description
                           reason:(NSString *)reason
                           domain:(NSString *)domain
                             code:(NSUInteger)code
                            parentError:(NSError *)error {
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    dict[NSLocalizedDescriptionKey] = description;
    dict[NSLocalizedFailureReasonErrorKey] = reason;
    if (error) {
        dict[NSUnderlyingErrorKey] = error;
    }
    
    return [NSError errorWithDomain:domain code:code userInfo:dict];
}

@end
