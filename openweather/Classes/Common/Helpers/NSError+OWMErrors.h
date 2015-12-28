//
//  NSError+OWMErrors.h
//  openweather
//
//  Created by Toni on 18/12/15.
//  Copyright © 2015 Toni. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSError (OWMErrors)

+ (NSError *)errorWithDescription:(NSString *)description
                           reason:(NSString *)reason
                           domain:(NSString *)domain
                             code:(NSUInteger)code
                      parentError:(NSError *)error;
@end
