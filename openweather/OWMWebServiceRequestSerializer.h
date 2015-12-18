//
//  OWMRequestSerializer.h
//  openweather
//
//  Created by Toni on 18/12/15.
//  Copyright © 2015 Toni. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>

@interface OWMWebServiceRequestSerializer : AFHTTPRequestSerializer

+ (instancetype)serializerWithAPIKey:(NSString *)APIkey;

@end
