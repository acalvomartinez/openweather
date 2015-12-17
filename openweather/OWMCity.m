//
//  OWMCity.m
//  openweather
//
//  Created by Toni on 17/12/15.
//  Copyright © 2015 Toni. All rights reserved.
//

#import "OWMCity.h"

@implementation OWMCity

+ (instancetype)cityWithId:(NSUInteger)cityId
                      name:(NSString *)name {
    OWMCity *city = [[OWMCity alloc] init];
    city.cityId = cityId;
    city.name = name;
    
    return city;
}

@end
