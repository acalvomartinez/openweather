//
//  OWMCity.m
//  openweather
//
//  Created by Toni on 17/12/15.
//  Copyright © 2015 Toni. All rights reserved.
//

#import "JSONCity.h"

@implementation JSONCity

+ (instancetype)cityWithId:(NSUInteger)cityId
                      name:(NSString *)name {
    JSONCity *city = [[JSONCity alloc] init];
    city.cityId = cityId;
    city.name = name;
    
    return city;
}

@end
