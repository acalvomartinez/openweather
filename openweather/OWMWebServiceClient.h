//
//  OWMWebServiceClient.h
//  openweather
//
//  Created by Toni on 18/12/15.
//  Copyright © 2015 Toni. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "OWMAPIWebServiceProtocol.h"

@interface OWMWebServiceClient : NSObject  <OWMAPIWebServiceProtocol>

- (instancetype)initWithAPIKey:(NSString *)APIKey NS_DESIGNATED_INITIALIZER;

@end
